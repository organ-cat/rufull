package com.cat.rufull.domain.service.message;

import com.cat.rufull.domain.mapper.message.MessageMapper;
import com.cat.rufull.domain.model.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("messageService")
@Transactional
public class MessageServiceImpl implements MessageService {
    private MessageMapper messageMapper;

    @Override
    public void insertMessage(Message message) {
        messageMapper.insertMessage(message);
    }

    @Override
    public void updateMessage(Message message) {
        messageMapper.updateMessage(message);
    }

    @Autowired
    public void setMessageMapper(MessageMapper messageMapper) {
        this.messageMapper = messageMapper;
    }
}
