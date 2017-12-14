package com.cat.rufull.test.message;

import com.cat.rufull.domain.mapper.lineItem.LineItemMapper;
import com.cat.rufull.domain.mapper.message.MessageMapper;
import com.cat.rufull.domain.mapper.order.OrderMapper;
import com.cat.rufull.domain.model.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;
import java.util.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:META-INF/spring/root-context.xml"})
public class MessageMapperTest {
    private static Logger logger = LoggerFactory.getLogger(MessageMapperTest.class);

    @Autowired
    private MessageMapper messageMapper;

    @Test
    public void testInsertMessage() {
        Message message = new Message();
        message.setType("催单");
        message.setContent("催单");
        message.setOrderId(4);
        message.setStatus("未回复");
        message.setSenderId(2);
        message.setReceiverId(3);

        messageMapper.insertMessage(message);
    }
}
