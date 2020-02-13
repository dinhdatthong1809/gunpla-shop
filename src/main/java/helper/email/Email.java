package helper.email;

public class Email {
    /* instance variables */
    private String subject;
    private String content;

    /* class's constructors */
    public Email(String subject, String content) {
	this.subject = subject;
	this.content = content;
    }

    /* getters - setters */
    public String getSubject() {
	return subject;
    }

    public void setSubject(String subject) {
	this.subject = subject;
    }

    public String getContent() {
	return content;
    }

    public void setContent(String content) {
	this.content = content;
    }

    /* instance methods */

}
