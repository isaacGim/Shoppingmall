package shop_member.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shop_member.bean.Shop_memberDTO;

@Repository	// 어노테이션으로 객체 인식
public class Shop_memberDAO {	// 회원정보 관련 DAO
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	/**  Mybatis로 데이터 주입  */
	// 회원가입
	public int insert(Shop_memberDTO shop_memberDTO) {
		return sqlSession.insert("mybatis.shop_member.insertShopMember", shop_memberDTO);
	}
	
	// 회원탈퇴
	public int delete(String id ) {
		return sqlSession.delete("mybatis.shop_member.deleteShopMember", id);
	}
	
	// 회원정보 수정
	public int update(Shop_memberDTO shop_memberDTO) {
		return sqlSession.update("mybatis.shop_member.updateShopMember", shop_memberDTO);
	}
	
	// 회원정보 불러오기
	public Shop_memberDTO getShopMember(Shop_memberDTO shop_memberDTO) {
		return sqlSession.selectOne("mybatis.shop_member.getShopMember", shop_memberDTO);
	}
	
	// 아이디 중복확인
	public boolean isExistId(String id) {
		boolean exist = false;
		if(sqlSession.selectOne("mybatis.shop_member.isExistId", id) != null) {
			exist = true;
		}
		return exist;
	}
	
	// 로그인
	public String login(String id, String pwd) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		return sqlSession.selectOne("mybatis.login.loginShopMember", map);
	}
	
	
	
}
