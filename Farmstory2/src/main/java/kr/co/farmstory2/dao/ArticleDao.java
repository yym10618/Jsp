package kr.co.farmstory2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.farmstory2.vo.ArticleVo;
import kr.co.farmstory2.dao.ArticleDao;
import kr.co.farmstory2.vo.FileVo;
import kr.co.farmstory2.config.DBConfig;
import kr.co.farmstory2.config.Sql;

public class ArticleDao {

	private static ArticleDao instance = new ArticleDao();
	public static ArticleDao getInstance() {
		return instance;
	}
	private ArticleDao() {}
	
	// 기본 CRUD
	public int insertArticle(ArticleVo vo) {
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
			psmt.setString(1, vo.getType());
			psmt.setString(2, vo.getTitle());
			psmt.setString(3, vo.getContent());
			psmt.setInt(4, vo.getFile());
			psmt.setString(5, vo.getUid());
			psmt.setString(6, vo.getRegip());
			psmt.executeUpdate();
			
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return selectMaxNo();
	}
	
	public int insertComment(ArticleVo vo) {
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_COMMENT);
			psmt.setInt(1, vo.getParent());
			psmt.setString(2, vo.getContent());
			psmt.setString(3, vo.getUid());
			psmt.setString(4, vo.getRegip());
			psmt.executeUpdate();
			
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return selectMaxNo();
	}
	
	public void insertFile(int parent, String oName, String nName) {
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_FILE);
			psmt.setInt(1, parent);
			psmt.setString(2, oName);
			psmt.setString(3, nName);
			psmt.executeUpdate();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int selectMaxNo() {
		
		int no = 0;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(Sql.SELECT_MAX_NO);
			
			if(rs.next()) {
				no = rs.getInt(1);
			}
			
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return no;
	}
	
	public int selectCountTotal(String type) {
		int total = 0;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_TOTAL);
			psmt.setString(1, type);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return total;
	}
	
	public ArticleVo selectArticle(String no) {
		
		ArticleVo article = new ArticleVo();
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLE);
			psmt.setString(1, no);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()){
				article.setNo(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setType(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setUid(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11).substring(2, 10));
				
				FileVo fv = new FileVo();
				fv.setFid(rs.getInt(12));
				fv.setParent(rs.getInt(13));
				fv.setoName(rs.getString(14));
				fv.setnName(rs.getString(15));
				fv.setDownload(rs.getInt(16));
				fv.setRdate(rs.getString(17));
									
				article.setFv(fv);
			}
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return article;
	}
	
	public List<ArticleVo> selectArticles(String type, int start) {
		
		List<ArticleVo> articles = new ArrayList<>();
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
			psmt.setString(1, type);
			psmt.setInt(2, start);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()){
				ArticleVo article = new ArticleVo();
				article.setNo(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setType(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setUid(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11).substring(2, 10));
				article.setNick(rs.getString(12));
				articles.add(article);
			}
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return articles;
	}
	
	public List<ArticleVo> selectComments(String parent) {
		
		List<ArticleVo> comments = new ArrayList<>();
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COMMENTS);
			psmt.setString(1, parent);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()){
				ArticleVo comment = new ArticleVo();
				comment.setNo(rs.getInt(1));
				comment.setParent(rs.getInt(2));
				comment.setComment(rs.getInt(3));
				comment.setType(rs.getString(4));
				comment.setTitle(rs.getString(5));
				comment.setContent(rs.getString(6));
				comment.setFile(rs.getInt(7));
				comment.setHit(rs.getInt(8));
				comment.setUid(rs.getString(9));
				comment.setRegip(rs.getString(10));
				comment.setRdate(rs.getString(11).substring(2, 10));
				comment.setNick(rs.getString(12));
				comments.add(comment);
			}
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return comments;
	}
	
	public ArticleVo selectComment(int no) {
		
		ArticleVo comment = new ArticleVo();
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COMMENT);
			psmt.setInt(1, no);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()){
				comment.setNo(rs.getInt(1));
				comment.setParent(rs.getInt(2));
				comment.setComment(rs.getInt(3));
				comment.setType(rs.getString(4));
				comment.setTitle(rs.getString(5));
				comment.setContent(rs.getString(6));
				comment.setFile(rs.getInt(7));
				comment.setHit(rs.getInt(8));
				comment.setUid(rs.getString(9));
				comment.setRegip(rs.getString(10));
				comment.setRdate(rs.getString(11).substring(2, 10));
				comment.setNick(rs.getString(12));
			}
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return comment;
	}

	public FileVo selectFile(String fid) {
		FileVo fvo = null;
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_FILE);
			psmt.setString(1, fid);
			
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				fvo = new FileVo();
				fvo.setFid(rs.getInt(1));
				fvo.setParent(rs.getInt(2));
				fvo.setoName(rs.getString(3));
				fvo.setnName(rs.getString(4));
				fvo.setDownload(rs.getInt(5));
				fvo.setRdate(rs.getString(6));
			}
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return fvo;
	}
	
	public List<ArticleVo> selectLatests(){
		
		List<ArticleVo> latests = new ArrayList<>();
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(Sql.SELECT_LATESTS);
			while(rs.next()) {
				ArticleVo article = new ArticleVo();
				article.setNo(rs.getInt(1));
				article.setType(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setRdate(rs.getString(11).substring(2, 10));
				latests.add(article);
			}
			
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return latests;
	}
	
	public void updateFileCount(String fid) {
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_FILE_COUNT);
			psmt.setString(1, fid);
			psmt.executeUpdate();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateArticle(String title, String content, String no) {
		
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, no);
			psmt.executeUpdate();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int updateComment(String content, String no) {
		
		int result = 0;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_COMMENT);
			psmt.setString(1, content);
			psmt.setString(2, no);
			result = psmt.executeUpdate();
			
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public void deleteArticle(String no) {
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.DELETE_ARTICLE);
			psmt.setString(1, no);
			psmt.executeUpdate();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int deleteComment(String no) {
		
		int result = 0;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.DELETE_COMMENT);
			psmt.setString(1, no);
			result = psmt.executeUpdate();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public void deleteCommentsByParent(String no) {
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.DELETE_COMMENTS_BY_PARENT);
			psmt.setString(1, no);
			psmt.executeUpdate();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
			
	public FileVo deleteFile(String no, String file) {
		
		FileVo vo = null;
		PreparedStatement psmt = null;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			if(Integer.parseInt(file) > 0) {
				psmt = conn.prepareStatement(Sql.SELECT_FILE_BY_PARENT);
				psmt.setString(1, no);
				ResultSet rs = psmt.executeQuery();
				if(rs.next()) {
					vo = new FileVo();
					vo.setnName(rs.getString(4));
				}
			}
			psmt = conn.prepareStatement(Sql.DELETE_FILE);
			psmt.setString(1, no);
			psmt.executeUpdate();
			
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
		
	}
}
