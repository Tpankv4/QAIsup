package io.github.patternatlas.api.service;

import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;

import io.github.patternatlas.api.entities.PatternForAlgorithm;
import io.github.patternatlas.api.exception.PatternLanguageNotFoundException;
import io.github.patternatlas.api.repositories.PatternForAlgorithmRepository;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class PatternForAlgorithmServiceImpl {

    private final PatternForAlgorithmRepository repo;

    Logger logger = LoggerFactory.getLogger(PatternForAlgorithmServiceImpl.class);

    public PatternForAlgorithmServiceImpl(PatternForAlgorithmRepository repository) {
        this.repo = repository;
    }

    @Transactional
    public PatternForAlgorithm saveAlgodata(ArrayList<Map<String, Object>> data, UUID id){
        PatternForAlgorithm input = new PatternForAlgorithm();
        input.setAlgodata(data);
        input.setId(id);
        return this.repo.save(input);

    }

    @Transactional (readOnly = true)
    public PatternForAlgorithm getAlgodata(UUID id) {
        return this.repo.findById(id).orElseThrow(() -> new PatternLanguageNotFoundException(id));
    }
}
