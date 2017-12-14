package com.cat.rufull.domain.service.product;

import com.cat.rufull.domain.mapper.product.ProductMapper;
import com.cat.rufull.domain.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("productService")
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;
    @Override
    public List<Product> findAll() {
        /**
        *@Author:Caoxin
        *@Description
        *@Date:21:17 2017/12/4
        *@param[]
        *@returnjava.util.List<com.cat.rufull.domain.model.Product>
        */
        return productMapper.findAll();
    }

    @Override
    public List<Product> findProductByShopId(Integer id) {
        /**
        *@Author:Caoxin
        *@Description
        *@Date:21:18 2017/12/4
        *@param[id]
        *@returnjava.util.List<com.cat.rufull.domain.model.Product>
        */
        return productMapper.findProductByShopId(id);
    }

    @Override
    public List<Product> fuzzyFindByProductNameAndProductDesc(String searchContext) {
        /**
        *@Author:Caoxin
        *@Description
        *@Date:10:17 2017/12/14
        *@param[searchContext:模糊查询的内容]
        *@returnjava.util.List<com.cat.rufull.domain.model.Product>
        */
        return productMapper.fuzzyFindByProductNameAndProductDesc(searchContext);
    }

    @Override
    public Product findProductById(Integer id) {
        /**
        *@Author:Caoxin
        *@Description
        *@Date:21:18 2017/12/4
        *@param[id]
        *@returncom.cat.rufull.domain.model.Product
        */
        return productMapper.findProductById(id);
    }

    @Override
    public int deleteById(Integer id) {
        /**
        *@Author:Caoxin
        *@Description
        *@Date:21:18 2017/12/4
        *@param[id]
        *@returnint
        */
        productMapper.deleteById(id);
        return 0;
    }

    @Override
    public int add(Product product) {
        /**
        *@Author:Caoxin
        *@Description
        *@Date:21:19 2017/12/4
        *@param[product]
        *@returnint
        */
        productMapper.add(product);
        return 0;
    }

    @Override
    public int updateByIdSelective(Product product) {
        /**
        *@Author:Caoxin
        *@Description
        *@Date:21:19 2017/12/4
        *@param[product]
        *@returnint
        */
        productMapper.updateByIdSelective(product);
        return 0;
    }

    @Override
    public int updateById(Product product) {
        /**
        *@Author:Caoxin
        *@Description
        *@Date:22:26 2017/12/4
        *@param[product]
        *@returnint
        */
        productMapper.updateById(product);
        return 0;
    }
}
