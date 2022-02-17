package kr.co.board1.db;

public class Sql {
	
	// user
	public static final String SELECT_TERMS = "SELECT * FROM `Board_terms`";
	public static final String INSERT_USER  = "INSERT INTO `Board_user` SET "
											+ "`uid`=?,"
											+ "`pass`=PASSWORD(?),"
											+ "`name`=?,"
											+ "`nick`=?,"
											+ "`email`=?,"
											+ "`hp`=?,"
											+ "`zip`=?,"
											+ "`addr1`=?,"
											+ "`addr2`=?,"
											+ "`regip`=?,"
											+ "`rdate`=NOW()";
	
	public static final String SELECT_USER = "SELECT * FROM `Board_user` WHERE `uid`=? AND `pass`=PASSWORD(?)";
	
	// board
	public static final String SELECT_MAX_ID = "SELECT MAX(`id`) FROM `Board_article`";
	
	public static final String SELECT_COUNT_ID = "SELECT COUNT(`id`) FROM `Board_article`";
	
	public static final String SELECT_ARTICLES = "SELECT a.*, b.`nick` FROM `Board_article` AS a "
												+"JOIN `Board_user` AS b "
												+"ON a.uid = b.uid "
												+"ORDER BY `id` DESC "
												+"LIMIT ?, 10;";
	
	public static final String INSERT_ARTICLE = "INSERT INTO `Board_article` SET "
												+ "`title`=?,"
												+ "`content`=?,"
												+ "`file`=?,"
												+ "`uid`=?,"
												+ "`regip`=?,"
												+ "`rdate`=NOW()";
	
	public static final String INSERT_FILE = "INSERT INTO `Board_file` SET "
											+ "`parent`=?,"
											+ "`oName`=?,"
											+ "`nName`=?,"
											+ "`rdate`=NOW()";
										
	
}