package io.github.patternatlas.api.rest.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import io.github.patternatlas.api.entities.PatternForAlgorithm;
import io.github.patternatlas.api.service.PatternForAlgorithmServiceImpl;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.hateoas.EntityModel;
import org.springframework.hateoas.Link;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@CrossOrigin(allowedHeaders = "*", origins = "*")
@RequestMapping(value = "/", produces = "application/hal+json")
public class PatternForAlgorithmController {

    final private static Logger LOG = LoggerFactory.getLogger(PatternForAlgorithmController.class);

    private final PatternForAlgorithmServiceImpl service;

    public PatternForAlgorithmController(PatternForAlgorithmServiceImpl patternforalgorithmservice){
        this.service = patternforalgorithmservice;
    }

    @Operation(operationId = "getPatternForAlgorithm", responses = {@ApiResponse(responseCode = "200"), @ApiResponse(responseCode = "404")}, description = "retrieve patterns for algorithm")
    @GetMapping(value = "/patternForAlgorithm/{patternLanguageId}")
    EntityModel<PatternForAlgorithm> getPatternForAlgorithm(@PathVariable UUID patternLanguageId) {
        List<Link> links = new ArrayList<>();
        links.add(linkTo(methodOn(PatternForAlgorithmController.class).getPatternForAlgorithm(patternLanguageId)).withSelfRel());
        return new EntityModel<>(this.service.getAlgodata(patternLanguageId), links);
    }

    @Operation(operationId = "savePatternForAlgorithm", responses = {@ApiResponse(responseCode = "201")}, description = "saved patterns for algorithm")
    @PostMapping(value = "/patternForAlgorithm/{patternLanguageId}/saveData")
    @CrossOrigin(exposedHeaders = "Location")
    @ResponseStatus(HttpStatus.CREATED)
    public ResponseEntity<?> savePatternForAlgorithm(@PathVariable UUID patternLanguageId, @RequestBody ArrayList<Map<String, Object>> data) {
        System.out.println(data);
        this.service.saveAlgodata(data, patternLanguageId);
        return ResponseEntity.created(linkTo(methodOn(PatternForAlgorithmController.class).getPatternForAlgorithm(patternLanguageId)).toUri()).build();
    }
}
