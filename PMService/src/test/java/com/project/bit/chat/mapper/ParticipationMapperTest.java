package com.project.bit.chat.mapper;

import com.project.bit.chat.domain.Message;
import com.project.bit.chat.domain.Participation;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.test.context.support.WithMockUser;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
@Slf4j
class ParticipationMapperTest {

  @Autowired
  private ParticipationMapper participationMapper;

  @Test
  @DisplayName("사용자가 속한 채팅방 조회")
  public void test() {
    participationMapper.findByUserId("user001");
  }

  @Test
  @DisplayName("사용자가 처음 채팅방에 들어갔을시 참여 추가")
  public void test2() {
    List<Participation> participations = new ArrayList<>();
    Participation user1 = Participation.builder().conversationId("1").userId("user003").build();
    Participation user2 = Participation.builder().conversationId("1").userId("user004").build();

    participations.add(user1);
    participations.add(user2);

    participationMapper.save(participations);

  }

  @Test
  @DisplayName("스프링 시큐리티 테스트")
  @WithMockUser(username = "user001")
  public void test3() {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

    log.info(authentication.getAuthorities()+"");
  }

  @Test
  @DisplayName("채팅방 나갈시에 참여 삭제")
  public void test4() {
    Message message = new Message();
    message.setAuthorId("user002");
    message.setRoomNo("33");

    participationMapper.leave(message);
  }
}