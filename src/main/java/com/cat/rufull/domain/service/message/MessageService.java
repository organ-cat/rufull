package com.cat.rufull.domain.service.message;

import com.cat.rufull.domain.model.Message;

public interface MessageService {
    void insertMessage(Message message);

    void updateMessage(Message message);
}
