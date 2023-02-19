use chat;

/*Описание занятия: Задача
    - загрузить мои чаты (я - user_id=1)
    - поля
        -- мой собеседник (имя)
        -- посл/сообщ (текст)

Конспект занятия
https://western-appeal-39b.notion.site/GenTech-Feb-14-2023-1a4b1e7e4f4848bb8ef713e029939e3b 
*/

SELECT other_user.fullname, messages.text
FROM chats
LEFT JOIN users AS user1 ON user1.user_id = chats.user1_id
LEFT JOIN users AS user2 ON user2.user_id = chats.user2_id
LEFT JOIN messages ON chats.chat_id = messages.chat_id
LEFT JOIN users AS other_user ON other_user.user_id = 
  CASE
    WHEN chats.user1_id = 1 THEN chats.user2_id
    WHEN chats.user2_id = 1 THEN chats.user1_id
  END
WHERE user1.user_id = 1 OR user2.user_id = 1
ORDER BY messages.created_at DESC
LIMIT 1;