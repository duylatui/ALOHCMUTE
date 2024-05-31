package entity;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the Comment database table.
 * 
 */
@Entity
@Table(name="Comment")
@NamedQuery(name="Comment.findAll", query="SELECT c FROM Comment c")
@NamedQuery(
	    name = "Comment.findByPostID",
	    query = "SELECT c FROM Comment c WHERE c.post.postID = :postID"
	)
public class Comment implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="CommentID", unique=true, nullable=false)
	private int commentID;

	@Column(name="CommentTime")
	private Timestamp commentTime;

	@Column(name="Content")
	private String content;

	//bi-directional many-to-one association to Post
	@ManyToOne
	@JoinColumn(name="PostID")
	private Post post;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="UserID")
	private User user;

	//bi-directional many-to-one association to Like
	@OneToMany(mappedBy="comment")
	private List<Like> likes;

	public Comment() {
	}

	public int getCommentID() {
		return this.commentID;
	}

	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}

	public Timestamp getCommentTime() {
		return this.commentTime;
	}

	public void setCommentTime(Timestamp commentTime) {
		this.commentTime = commentTime;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Post getPost() {
		return this.post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Like> getLikes() {
		return this.likes;
	}

	public void setLikes(List<Like> likes) {
		this.likes = likes;
	}

	public Like addLike(Like like) {
		getLikes().add(like);
		like.setComment(this);

		return like;
	}

	public Like removeLike(Like like) {
		getLikes().remove(like);
		like.setComment(null);

		return like;
	}

}