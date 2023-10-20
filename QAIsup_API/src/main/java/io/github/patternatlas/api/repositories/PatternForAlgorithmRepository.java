package io.github.patternatlas.api.repositories;

import java.util.UUID;

import io.github.patternatlas.api.entities.PatternForAlgorithm;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(exported = false)
public interface PatternForAlgorithmRepository extends CrudRepository<PatternForAlgorithm, UUID> {
}
