package com.utf18.site.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.utf18.site.dao.ChatDAO;
import com.utf18.site.vo.ChatMemberVO;
import com.utf18.site.vo.ChatVO;

@Repository
public class ChatDAO{
   @Autowired
   private SqlSessionTemplate mybatis;
   
   private String ns = "ChatDAO.";

   public ChatVO checkRoom(String name) throws Exception {
      return mybatis.selectOne(ns+"getRoom", name);
   }

   public void createChatRoom(ChatVO vo) throws Exception {
      mybatis.insert(ns+"createChatRoom", vo);
   }

   public List<ChatVO> getRoomList() throws Exception {
      return mybatis.selectList(ns+"getRoomList");
   }

   public void addRoomMember(ChatMemberVO mem) throws Exception {
      mybatis.insert(ns+"addRoomMember",mem);
   }

   public ChatMemberVO getRoomMember(ChatMemberVO mem) throws Exception {
      return mybatis.selectOne(ns+"getRoomMember", mem);
   }

   public List<ChatMemberVO> sameRoomList(ChatMemberVO mem) throws Exception {
      return mybatis.selectList(ns+"sameRoomList",mem);
   }

   public void updateRoomMember(ChatMemberVO mem) throws Exception {
      mybatis.update(ns+"updateRoomMember", mem);
   }

   public void deleteRoomMember(ChatMemberVO mem) throws Exception {
      mybatis.delete(ns+"deleteRoomMember", mem);
   }

   public void updateChatCountInc(ChatVO vo) throws Exception {
      mybatis.update(ns+"updateChatCountInc", vo);
   }

   public void updateChatCountDec(ChatVO vo) throws Exception {
      mybatis.update(ns+"updateChatCountDec", vo);
   }

   public void deleteChat() throws Exception {
      mybatis.delete(ns+"deleteChat");
   }

   public List<ChatVO> searchRoomList(String name) throws Exception {
      return mybatis.selectList(ns+"searchRoomList", name);
   }
}