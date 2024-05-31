package entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Users database table.
 * 
 */
@Entity
@Table(name="Users")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="UserID", unique=true, nullable=false)
	private int userID;

	@Column(name="Admin")
	private int admin;

	@Column(name="AvatarURL", length=255)
	private String avatarURL;

	@Column(name="Email", nullable=false, length=255)
	private String email;

	@Column(name="Password", nullable=false, length=255)
	private String password;

	@Column(name="UserName", nullable=false, length=255)
	private String userName;

	//bi-directional many-to-one association to Comment
	@OneToMany(mappedBy="user")
	private List<Comment> comments;

	//bi-directional many-to-one association to FriendRequest
	@OneToMany(mappedBy="user1")
	private List<FriendRequest> friendRequests1;

	//bi-directional many-to-one association to FriendRequest
	@OneToMany(mappedBy="user2")
	private List<FriendRequest> friendRequests2;

	//bi-directional many-to-one association to Friendship
	@OneToMany(mappedBy="user1")
	private List<Friendship> friendships1;

	//bi-directional many-to-one association to Friendship
	@OneToMany(mappedBy="user2")
	private List<Friendship> friendships2;

	//bi-directional many-to-one association to Like
	@OneToMany(mappedBy="user")
	private List<Like> likes;

	//bi-directional many-to-one association to Post
	@OneToMany(mappedBy="user")
	private List<Post> posts;

	//bi-directional many-to-one association to PrivateMessage
	@OneToMany(mappedBy="user1")
	private List<PrivateMessage> privateMessages1;

	//bi-directional many-to-one association to PrivateMessage
	@OneToMany(mappedBy="user2")
	private List<PrivateMessage> privateMessages2;

	

	public User() {
		super();
	}


	public int getUserID() {
		return this.userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getAdmin() {
		return this.admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public String getAvatarURL() {
		return this.avatarURL;
	}

	public void setAvatarURL(String avatarURL) {
		this.avatarURL = avatarURL;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<Comment> getComments() {
		return this.comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public Comment addComment(Comment comment) {
		getComments().add(comment);
		comment.setUser(this);

		return comment;
	}

	public Comment removeComment(Comment comment) {
		getComments().remove(comment);
		comment.setUser(null);

		return comment;
	}

	public List<FriendRequest> getFriendRequests1() {
		return this.friendRequests1;
	}

	public void setFriendRequests1(List<FriendRequest> friendRequests1) {
		this.friendRequests1 = friendRequests1;
	}

	public FriendRequest addFriendRequests1(FriendRequest friendRequests1) {
		getFriendRequests1().add(friendRequests1);
		friendRequests1.setUser1(this);

		return friendRequests1;
	}

	public FriendRequest removeFriendRequests1(FriendRequest friendRequests1) {
		getFriendRequests1().remove(friendRequests1);
		friendRequests1.setUser1(null);

		return friendRequests1;
	}

	public List<FriendRequest> getFriendRequests2() {
		return this.friendRequests2;
	}

	public void setFriendRequests2(List<FriendRequest> friendRequests2) {
		this.friendRequests2 = friendRequests2;
	}

	public FriendRequest addFriendRequests2(FriendRequest friendRequests2) {
		getFriendRequests2().add(friendRequests2);
		friendRequests2.setUser2(this);

		return friendRequests2;
	}

	public FriendRequest removeFriendRequests2(FriendRequest friendRequests2) {
		getFriendRequests2().remove(friendRequests2);
		friendRequests2.setUser2(null);

		return friendRequests2;
	}

	public List<Friendship> getFriendships1() {
		return this.friendships1;
	}

	public void setFriendships1(List<Friendship> friendships1) {
		this.friendships1 = friendships1;
	}

	public Friendship addFriendships1(Friendship friendships1) {
		getFriendships1().add(friendships1);
		friendships1.setUser1(this);

		return friendships1;
	}

	public Friendship removeFriendships1(Friendship friendships1) {
		getFriendships1().remove(friendships1);
		friendships1.setUser1(null);

		return friendships1;
	}

	public List<Friendship> getFriendships2() {
		return this.friendships2;
	}

	public void setFriendships2(List<Friendship> friendships2) {
		this.friendships2 = friendships2;
	}

	public Friendship addFriendships2(Friendship friendships2) {
		getFriendships2().add(friendships2);
		friendships2.setUser2(this);

		return friendships2;
	}

	public Friendship removeFriendships2(Friendship friendships2) {
		getFriendships2().remove(friendships2);
		friendships2.setUser2(null);

		return friendships2;
	}

	public List<Like> getLikes() {
		return this.likes;
	}

	public void setLikes(List<Like> likes) {
		this.likes = likes;
	}

	public Like addLike(Like like) {
		getLikes().add(like);
		like.setUser(this);

		return like;
	}

	public Like removeLike(Like like) {
		getLikes().remove(like);
		like.setUser(null);

		return like;
	}

	public List<Post> getPosts() {
		return this.posts;
	}

	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}

	public Post addPost(Post post) {
		getPosts().add(post);
		post.setUser(this);

		return post;
	}

	public Post removePost(Post post) {
		getPosts().remove(post);
		post.setUser(null);

		return post;
	}

	public List<PrivateMessage> getPrivateMessages1() {
		return this.privateMessages1;
	}

	public void setPrivateMessages1(List<PrivateMessage> privateMessages1) {
		this.privateMessages1 = privateMessages1;
	}

	public PrivateMessage addPrivateMessages1(PrivateMessage privateMessages1) {
		getPrivateMessages1().add(privateMessages1);
		privateMessages1.setUser1(this);

		return privateMessages1;
	}

	public PrivateMessage removePrivateMessages1(PrivateMessage privateMessages1) {
		getPrivateMessages1().remove(privateMessages1);
		privateMessages1.setUser1(null);

		return privateMessages1;
	}

	public List<PrivateMessage> getPrivateMessages2() {
		return this.privateMessages2;
	}

	public void setPrivateMessages2(List<PrivateMessage> privateMessages2) {
		this.privateMessages2 = privateMessages2;
	}

	public PrivateMessage addPrivateMessages2(PrivateMessage privateMessages2) {
		getPrivateMessages2().add(privateMessages2);
		privateMessages2.setUser2(this);

		return privateMessages2;
	}

	public PrivateMessage removePrivateMessages2(PrivateMessage privateMessages2) {
		getPrivateMessages2().remove(privateMessages2);
		privateMessages2.setUser2(null);

		return privateMessages2;
	}

}