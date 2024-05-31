package entity;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;


/**
 * The persistent class for the Likes database table.
 * 
 */
@Entity
@Table(name="Likes")
@NamedQuery(name="Like.findAll", query="SELECT l FROM Like l")
public class Like implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="LikeID", unique=true, nullable=false)
	private int likeID;

	@Column(name="LikeTime")
	private Timestamp likeTime;

	//bi-directional many-to-one association to Comment
	@ManyToOne
	@JoinColumn(name="CommentID")
	private Comment comment;

	//bi-directional many-to-one association to Post
	@ManyToOne
	@JoinColumn(name="PostID")
	private Post post;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="UserID")
	private User user;

	public Like() {
	}

	public int getLikeID() {
		return this.likeID;
	}

	public void setLikeID(int likeID) {
		this.likeID = likeID;
	}

	public Timestamp getLikeTime() {
		return this.likeTime;
	}

	public void setLikeTime(Timestamp likeTime) {
		this.likeTime = likeTime;
	}

	public Comment getComment() {
		return this.comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
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

}