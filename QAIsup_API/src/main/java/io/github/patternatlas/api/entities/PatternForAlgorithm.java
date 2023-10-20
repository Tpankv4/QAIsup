package io.github.patternatlas.api.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import javax.validation.constraints.NotNull;
import lombok.Data;
import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;

@Entity
@Data
@TypeDefs({
        @TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)
})
public class PatternForAlgorithm {
    @Id
    private UUID id;

    @Type(type = "jsonb")
    @Column(columnDefinition = "jsonb")
    @NotNull
    private ArrayList<Map<String, Object>> algodata;
}
