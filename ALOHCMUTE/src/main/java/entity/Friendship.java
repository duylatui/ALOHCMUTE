package entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Friendship database table.
 * 
 */
@Entity
@Table(name="Friendship")
@NamedQuery(name="Friendship.findAll", query="SELECT f FROM Friendship f")
public class Friendship implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="FriendshipID", unique=true, nullable=false)
	private int friendshipID;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="User1ID")
	private User user1;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="User2ID")
	private User user2;

	public Friendship() {
	}

	public int getFriendshipID() {
		return this.friendshipID;
	}

	public void setFriendshipID(int friendshipID) {
		this.friendshipID = friendshipID;
	}

	public User getUser1() {
		return this.user1;
	}

	public void setUser1(User user1) {
		this.user1 = user1;
	}

	public User getUser2() {
		return this.user2;
	}

	public void setUser2(User user2) {
		this.user2 = user2;
	}

}