package entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the FriendRequest database table.
 * 
 */
@Entity
@Table(name="FriendRequest")
@NamedQuery(name="FriendRequest.findAll", query="SELECT f FROM FriendRequest f")
public class FriendRequest implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="RequestID", unique=true, nullable=false)
	private int requestID;

	@Column(name="IsAccepted")
	private int isAccepted;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="SenderID")
	private User user1;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="ReceiverID")
	private User user2;

	public FriendRequest() {
	}

	public int getRequestID() {
		return this.requestID;
	}

	public void setRequestID(int requestID) {
		this.requestID = requestID;
	}

	public int getIsAccepted() {
		return this.isAccepted;
	}

	public void setIsAccepted(int isAccepted) {
		this.isAccepted = isAccepted;
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