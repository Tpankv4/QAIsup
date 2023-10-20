package io.github.patternatlas.api.entities.issue;

import java.util.ArrayList;
import java.util.List;

import io.github.patternatlas.api.entities.EntityWithURI;
import io.github.patternatlas.api.entities.issue.author.IssueAuthor;
import io.github.patternatlas.api.entities.issue.comment.IssueComment;
import io.github.patternatlas.api.entities.issue.evidence.IssueEvidence;
import io.github.patternatlas.api.rest.model.issue.IssueModelRequest;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
public class Issue extends EntityWithURI {

    private String description;

    private String version = "0.1.0";

    private int rating;

    @JsonIgnore
    @OneToMany(mappedBy = "issue", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<IssueAuthor> authors = new ArrayList<>();

    @JsonIgnore
    @OneToMany(mappedBy = "issue", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<IssueRating> userRating = new ArrayList<>();

    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @OneToMany(mappedBy = "issue", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<IssueComment> comments = new ArrayList<>();

    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @OneToMany(mappedBy = "issue", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<IssueEvidence> evidences = new ArrayList<>();

    public Issue (IssueModelRequest issueModelRequest) {
        this.setUri(issueModelRequest.getUri());
        this.setName(issueModelRequest.getName());
        this.setDescription(issueModelRequest.getDescription());
        this.setVersion(issueModelRequest.getVersion());
        this.setRating(issueModelRequest.getRating());
    }

    public void updateIssue(IssueModelRequest issueModelRequest) {
        this.setUri(issueModelRequest.getUri());
        this.setName(issueModelRequest.getName());
        this.setDescription(issueModelRequest.getDescription());
        this.setVersion(issueModelRequest.getVersion());
        this.setRating(issueModelRequest.getRating());
    }

    public String toString() {
        return this.getId().toString() + this.getDescription() + this.getComments().toString();
    }

}