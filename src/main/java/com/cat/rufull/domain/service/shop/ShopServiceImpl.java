package com.cat.rufull.domain.service.shop;

import com.cat.rufull.domain.mapper.product.ProductMapper;
import com.cat.rufull.domain.mapper.shop.ShopMapper;
import com.cat.rufull.domain.model.Product;
import com.cat.rufull.domain.model.Shop;
import com.cat.rufull.domain.service.evaluation.EvaluationService;
import com.cat.rufull.domain.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Transactional
@Service("shopService")
public class ShopServiceImpl implements ShopService {
    @Autowired
    private ShopMapper shopMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private EvaluationService evaluationService;

    @Autowired
    private OrderService orderService;

    @Override
    public List<Shop> findAllShop() {
        return shopMapper.findAllShop();
    }

    @Override
    public List<Shop> findAll() {
        /**
        *@Author:Caoxin
        *@Description:// 查询全部商店
        *@Date:9:03 2017/12/4
        *@param[]
        *@returnjava.util.List<com.cat.rufull.domain.model.Shop>
        */
        List<Shop> shopList= new ArrayList<Shop>();

        List<Shop> allOnlineShop = shopMapper.findAllOnlineShop(); //查询在线的商家
        List<Shop> allNotOnlineShop = shopMapper.findAllNotOnlineShop();//查询所有不在线的商家

        shopList.addAll(allOnlineShop);
        shopList.addAll(allNotOnlineShop);
        return shopList;
    }

    @Override
    public Shop findById(Integer id) {
        /**
        *@Author:Caoxin
        *@Description：通过id查询一个商店
        *@Date:9:05 2017/12/4
        *@param[id]
        *@returncom.cat.rufull.domain.model.Shop
        */
        return shopMapper.findById(id);
    }

    @Override
    public int deleteById(Integer id) {
        /**
        *@Author:Caoxin
        *@Description:通过id删除商家，这个一般不用，一般通过改变商店状态
        *@Date:9:03 2017/12/4
        *@param[id]
        *@returnint
        */
        shopMapper.deleteById(id);
        return 0;
    }

    @Override
    public int add(Shop shop) {
        /**
        *@Author:Caoxin
        *@Description:增加一个商店
        *@Date:9:04 2017/12/4
        *@param[shop]
        *@returnint
        */
        shopMapper.add(shop);
        return 0;
    }

    @Override
    public int updateByIdSelective(Shop shop) {
        /**
        *@Author:Caoxin
        *@Description:通过id和其他属性的组合去更新的一个商店，任何的属性都可以
        *@Date:9:05 2017/12/4
        *@param[shop]
        *@returnint
        */
        shopMapper.updateByIdSelective(shop);
        return 0;
    }

    @Override
    public int updateById(Shop shop) {
        /**
        *@Author:Caoxin
        *@Description:通过id更新一个shop，所有的字段都需要输入，一般不用
        *@Date:9:06 2017/12/4
        *@param[shop]
        *@returnint
        */
        shopMapper.updateById(shop);
        return 0;
    }

    @Override
    public List<Shop> fuzzyFindByShopName(String shopName) {
        /**
        *@Author:Caoxin
        *@Description:通过商家名字模糊查询商家
        *@Date:10:31 2017/12/14
        *@param[shopName]
        *@returnjava.util.List<com.cat.rufull.domain.model.Shop>
        */
        return shopMapper.fuzzyFindByShopName(shopName);
    }

    @Override
    public List<Shop> fuzzyFindByShopAndProduct(String searchContext) {
        /**
        *@Author:Caoxin
        *@Description：通过查询内容查询出商家
        *@Date:10:32 2017/12/14
        *@param[searchContext]
        *@returnjava.util.List<com.cat.rufull.domain.model.Shop>
        */

        List<Shop> shopListSearchOfProduct = new LinkedList<Shop>();
        //通过查询内容查询不重复shop_id的商品
        List<Product> products =
                productMapper.fuzzyFindByProductNameAndProductDesc("%" + searchContext + "%");
        //通过商品查询出对应的商店
        for (Product product:products
             ) {
            Shop shop = shopMapper.findById(product.getShopId());
            shopListSearchOfProduct.add(shop);
        }
        //通过商店名称模糊查询出对应的名称
        List<Shop> shopListSearchOfShop = shopMapper.fuzzyFindByShopName("%" + searchContext + "%");

        //组装成ShopList
        shopListSearchOfShop.addAll(shopListSearchOfProduct);

        //通过HashSet去除重复的商店
        HashSet<Shop> shopSet = new HashSet<Shop>(shopListSearchOfShop);

        //组装成List集合
       LinkedList<Shop> shopLinkedList =  new LinkedList<Shop>();
        Iterator<Shop> shopIterator = shopSet.iterator();
        while (shopIterator.hasNext()){
            shopLinkedList.add(shopIterator.next());
        }
        return shopLinkedList;
    }
    /**
     *@Author:Caoxin
     *@Description
     *@Date:2:49 2017/12/19
     *@param[shopList]查询对应商店中的商品的评价
     *@returnjava.util.Map<java.lang.Integer,java.lang.Integer>
     */
    @Override
    public Map<Integer, Integer> getShopProductEvaluation(Shop shop) {
        Map<Integer,Integer> productEvaluation = new HashMap<Integer, Integer>();

        Double evaluation = null;
        for (Product product:shop.getProductList()
             ) {
            try {
                evaluation = Math.ceil(evaluationService.findAvarageByProductId(product.getId()));
            } catch (Exception e) {
                e.printStackTrace();
            }
            Integer shopEvaluation;
            if(evaluation == null){
                shopEvaluation = 0;
            }else{
                shopEvaluation  = evaluation.intValue();
            }
            productEvaluation.put(product.getId(),shopEvaluation);
        }

        return productEvaluation;
    }

    /**
     *@Author:Caoxin
     *@Description:查询所有商家每月销售量
     *@Date:0:58 2017/12/19
     *@param[shopList]
     *@returnjava.util.Map<java.lang.Integer,java.lang.Integer>
     */
    @Override
    public Map<Integer, Integer> getShopSales(List<Shop> shopList) {

        Map<Integer,Integer> shopSalesMap = new HashMap<Integer, Integer>();

        for (Shop shop:shopList
                ) {
            Integer monthlySales = orderService.getMonthlySales(shop.getId());
            shopSalesMap.put(shop.getId(),monthlySales);
        }
        return shopSalesMap;
    }

    /**
     *@Author:Caoxin
     *@Description：查询全部商品评分
     *@Date:23:55 2017/12/18
     *@param[shopList]
     *@returnjava.util.Map<java.lang.Integer,java.lang.Integer>
     */
    @Override
    public Map<Integer, Integer> getShopEvaluation(List<Shop> shopList) {

        Map<Integer,Integer> shopEvaluationMap = new HashMap<Integer, Integer>();
        for (Shop shop:shopList
             ) {
            Double evaluation = null;
            try {
                evaluation = Math.ceil(evaluationService.findAvarageByShopId(shop.getId()));
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("查询商店评分出错。。。");

            }
            Integer shopEvaluation;
            if(evaluation == null){
                shopEvaluation = 0;
            }else{
                shopEvaluation  = evaluation.intValue();
            }
            shopEvaluationMap.put(shop.getId(),shopEvaluation);
        }
        return shopEvaluationMap;
    }

    @Override
    public Shop findShopByBusinessId(Integer id) {
        /**
        *@Author:Caoxin
        *@Description:通过商家Id，查询出对应的商店
        *@Date:10:31 2017/12/14
        *@param[id]
        *@returncom.cat.rufull.domain.model.Shop
        */
        return shopMapper.findShopByBusinessId(id);
    }
}
