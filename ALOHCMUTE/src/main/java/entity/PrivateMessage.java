package entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;


/**
 * The persistent class for the PrivateMessage database table.
 * 
 */
@Entity
@Table(name="PrivateMessage")
@NamedQuery(name="PrivateMessage.findAll", query="SELECT p FROM PrivateMessage p")
public class PrivateMessage implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="MessageID", unique=true, nullable=false)
	private int messageID;

	@Column(name="MessageContent")
	private String messageContent;
	
	@Column(name="Timestamp") // Thêm cột timestamp
    @Temporal(TemporalType.TIMESTAMP) // Định nghĩa kiểu dữ liệu của timestamp
    private Date timestamp;
	
	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="SenderUserID")
	private User user1;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="ReceiverUserID")
	private User user2;

	public PrivateMessage() {
	}

	public int getMessageID() {
		return this.messageID;
	}

	public void setMessageID(int messageID) {
		this.messageID = messageID;
	}
	
	public Date getTimestamp() {
        return this.timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }
    
	public String getMessageContent() {
		return this.messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
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