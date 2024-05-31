package entity;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the Post database table.
 * 
 */
@Entity
@Table(name="Post")

@NamedQuery(name="Post.findAll", query="SELECT p FROM Post p")
@NamedQuery(name = "Post.findById", query = "SELECT p FROM Post p WHERE p.postID = :postID")
@NamedQuery(name="Post.findByMonth", query="SELECT p FROM Post p WHERE MONTH(p.postTime) = :month")

public class Post implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="PostID", unique=true, nullable=false)
	private int postID;

	@Column(name="Comments")
	private int comments;

	@Column(name="Content")
	private String content;

	@Column(name="ImageVideoURL", length=255)
	private String imageVideoURL;

	@Column(name="Likes")
	private int likes;

	@Column(name="PostTime")
	private Timestamp postTime;

	//bi-directional many-to-one association to Comment
	@OneToMany(mappedBy="post")
	private List<Comment> commentsSet;

	//bi-directional many-to-one association to Like
	@OneToMany(mappedBy="post")
	private List<Like> likesSet;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="UserID")
	private User user;

	public Post() {
	}

	public int getPostID() {
		return this.postID;
	}

	public void setPostID(int postID) {
		this.postID = postID;
	}

	public int getComments() {
		return this.comments;
	}

	public void setComments(int comments) {
		this.comments = comments;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImageVideoURL() {
		return this.imageVideoURL;
	}

	public void setImageVideoURL(String imageVideoURL) {
		this.imageVideoURL = imageVideoURL;
	}

	public int getLikes() {
		return this.likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public Timestamp getPostTime() {
		return this.postTime;
	}

	public void setPostTime(Timestamp postTime) {
		this.postTime = postTime;
	}

	public List<Comment> getCommentsSet() {
		return this.commentsSet;
	}

	public void setCommentsSet(List<Comment> commentsSet) {
		this.commentsSet = commentsSet;
	}

	public Comment addCommentsSet(Comment commentsSet) {
		getCommentsSet().add(commentsSet);
		commentsSet.setPost(this);

		return commentsSet;
	}

	public Comment removeCommentsSet(Comment commentsSet) {
		getCommentsSet().remove(commentsSet);
		commentsSet.setPost(null);

		return commentsSet;
	}

	public List<Like> getLikesSet() {
		return this.likesSet;
	}

	public void setLikesSet(List<Like> likesSet) {
		this.likesSet = likesSet;
	}

	public Like addLikesSet(Like likesSet) {
		getLikesSet().add(likesSet);
		likesSet.setPost(this);

		return likesSet;
	}

	public Like removeLikesSet(Like likesSet) {
		getLikesSet().remove(likesSet);
		likesSet.setPost(null);

		return likesSet;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}