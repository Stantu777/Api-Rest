package me.draku.genesis.thesis.data;

import javax.validation.constraints.NotNull;

public final class RegisterThesisForm {
    @NotNull
    private long authorId;

    @NotNull
    private String topic;

    @NotNull
    private int lineOfInvestigationId;

    @NotNull
    private String description;

    private long partnerId;

    public long getAuthorId() {
        return authorId;
    }

    public void setAuthorId(long authorId) {
        this.authorId = authorId;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public int getLineOfInvestigationId() {
        return lineOfInvestigationId;
    }

    public void setLineOfInvestigationId(int lineOfInvestigationId) {
        this.lineOfInvestigationId = lineOfInvestigationId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getPartnerId() {
        return partnerId;
    }

    public void setPartnerId(long partnerId) {
        this.partnerId = partnerId;
    }
}
