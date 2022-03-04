-- 게시판 DB 만들기

DROP TABLE board;

-- 글 번호(기본키), 작성자 이름, 제목, 내용, 작성일, 조회수

CREATE TABLE board(
    board_idx       number(4) primary key,
    board_name      varchar2(20),
    board_title     varchar2(100),
    board_content   varchar2(300),
    board_date      DATE DEFAULT sysdate,
    board_hit       number(4) DEFAULT 0
);

DROP SEQUENCE board_seq;

CREATE SEQUENCE board_seq;

INSERT INTO board (board_idx, board_name, board_title, board_content, board_date)
            VALUES (board_seq.nextval, '홍길동', '글 제목1', '글 내용1', sysdate);
INSERT INTO board (board_idx, board_name, board_title, board_content, board_date)
            VALUES (board_seq.nextval, '변사또', '글 제목2', '글 내용2', sysdate);
INSERT INTO board (board_idx, board_name, board_title, board_content, board_date)
            VALUES (board_seq.nextval, '사임당', '글 제목3', '글 내용3', sysdate);
            
SELECT * FROM board ORDER BY board_idx DESC;


DROP TABLE reply;

-- 댓글 번호(기본키), 작성자 이름, 내용, 작성일, 글 번호(외래키)
-- reply_board_idx : 외래키 - 다른 테이블의 인덱스키를 가지고 있음.

CREATE TABLE reply(
    reply_idx       number(4) primary key,
    reply_name      varchar2(20),
    reply_content   varchar2(300),
    reply_date      DATE DEFAULT sysdate,
    reply_board_idx number(4)    
);

DROP SEQUENCE reply_board_seq;

CREATE SEQUENCE reply_board_seq;

INSERT INTO reply (reply_idx, reply_name, reply_content, reply_date, reply_board_idx)
            VALUES (reply_board_seq.nextval, '홍두깨', '댓글 내용1', sysdate, 1);
INSERT INTO reply (reply_idx, reply_name, reply_content, reply_date, reply_board_idx)
            VALUES (reply_board_seq.nextval, '심청', '댓글 내용2', sysdate, 2);
INSERT INTO reply (reply_idx, reply_name, reply_content, reply_date, reply_board_idx)
            VALUES (reply_board_seq.nextval, '심봉사', '댓글 내용3', sysdate, 3);
INSERT INTO reply (reply_idx, reply_name, reply_content, reply_date, reply_board_idx)
            VALUES (reply_board_seq.nextval, '심봉사2', '댓글 내용4', sysdate, 3);
            
SELECT * FROM board;
SELECT * FROM reply;

SELECT COUNT(*) FROM reply WHERE reply_board_idx=3;

SELECT * FROM reply WHERE reply_board_idx=3;

UPDATE board SET board_name='홍길동2', board_title='글 제목1',
                  board_content='글 내용1'
                  WHERE board_idx=1;
                  
UPDATE board SET board_hit = board_hit+1 WHERE board_idx=1;
                        
DELETE FROM board WHERE board_idx=4;


commit;
