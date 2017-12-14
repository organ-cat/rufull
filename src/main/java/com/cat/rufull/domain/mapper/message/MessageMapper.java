package com.cat.rufull.domain.mapper.message;

import com.cat.rufull.domain.model.Message;

public interface MessageMapper {

    public void insertMessage(Message message);

    public void updateMessage(Message message);
}
