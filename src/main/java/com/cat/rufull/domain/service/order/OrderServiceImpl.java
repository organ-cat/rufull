package com.cat.rufull.domain.service.order;

import com.cat.rufull.domain.mapper.order.OrderMapper;
import com.cat.rufull.domain.service.user.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

}
