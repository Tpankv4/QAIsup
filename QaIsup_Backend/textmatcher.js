const keyword_extractor = require("keyword-extractor");
const rake = require('rake-js');

var openai = require("./openaifunctionality.js");

module.exports = function(data, isRake, useOpenAI) {
	
	if(useOpenAI){
		return openai("Can you rephrase the following sentence without negations: " + data.input).then((resolve) => {
			console.log("resolve");
			console.log(resolve);
			return matching(data, isRake, resolve.choices[0].message.content);
		});
	
	}else{
		return matching(data, isRake, data.input);
	}
	
}
	
	function matching(data, isRake, resultvalue){
		
		var infos = data.algodata;
		var datainput = resultvalue;
		console.log("input:");
	    console.log(data.input);
	
		var allkeywords = [];
		var results = [];
		infos.forEach(algorithminfo => {
		
			if(isRake){
				const intentkeywords2 = rake.default(algorithminfo.data.intent, { language: 'english' });
				const problemkeywords2 = rake.default(algorithminfo.data.problem, { language: 'english' });
				const solutionkeywords2 = rake.default(algorithminfo.data.solution, { language: 'english' });

				let intentkeywords = [];
				let problemkeywords = [];
				let solutionkeywords = [];
				intentkeywords2.forEach(words => {
					intentkeywords = intentkeywords.concat(words.split(' '));
				});
				problemkeywords2.forEach(words => {
					problemkeywords = intentkeywords.concat(words.split(' '));
				});
				solutionkeywords2.forEach(words => {
					solutionkeywords = intentkeywords.concat(words.split(' '));
				});
				
				//quadruple value
				var applicationareaskeywords = []; 
				var problemtypeskeywords = [];
				algorithminfo.data.applicationAreas.forEach(word => {
					applicationareaskeywords.push(word.label);
					applicationareaskeywords.push(word.label);
					applicationareaskeywords.push(word.label);
					applicationareaskeywords.push(word.label);
				});
				algorithminfo.data.problemTypes.forEach(word => {
					problemtypeskeywords.push(word.label);
					problemtypeskeywords.push(word.label);
					problemtypeskeywords.push(word.label);
					problemtypeskeywords.push(word.label);
				});
			
				allkeywords.push({name: algorithminfo.name, 
			                  keywords: intentkeywords.concat(intentkeywords).concat(problemkeywords, solutionkeywords)
							            .concat(applicationareaskeywords, problemtypeskeywords)
				});
					
			}else{
				const intentkeywords = keyword_extractor.extract(algorithminfo.data.intent,{
			    language:"english",
			    remove_digits: true,
			    return_changed_case:true,
			    remove_duplicates: false
		    });
				const problemkeywords = keyword_extractor.extract(algorithminfo.data.problem,{
			    language:"english",
			    remove_digits: true,
			    return_changed_case:true,
			    remove_duplicates: false
		    });
				const solutionkeywords = keyword_extractor.extract(algorithminfo.data.solution,{
			    language:"english",
			    remove_digits: true,
			    return_changed_case:true,
			    remove_duplicates: false
		    });
			
			//quadruple value
			var applicationareaskeywords = []; 
			var problemtypeskeywords = [];
			algorithminfo.data.applicationAreas.forEach(word => {
				applicationareaskeywords.push(word.label);
				applicationareaskeywords.push(word.label);
				applicationareaskeywords.push(word.label);
				applicationareaskeywords.push(word.label);
			});
			algorithminfo.data.problemTypes.forEach(word => {
				problemtypeskeywords.push(word.label);
				problemtypeskeywords.push(word.label);
				problemtypeskeywords.push(word.label);
				problemtypeskeywords.push(word.label);
			});
			
			allkeywords.push({name: algorithminfo.name, 
			                  keywords: intentkeywords.concat(intentkeywords).concat(problemkeywords, solutionkeywords)
							            .concat(applicationareaskeywords, problemtypeskeywords)});
			}
			
		});
		
		allkeywords.forEach(algo => {
			const occurrences = algo.keywords.reduce(function (acc, curr) {
			return acc[curr] ? ++acc[curr] : acc[curr] = 1, acc}, {});
			results.push({name: algo.name, occurrences: occurrences});
		});

		var extraction_result_input = [];
		var similarities = [];
		
		if(isRake){
			extraction_result_input2 = rake.default(datainput, { language: 'english' });
			extraction_result_input2.forEach(words => {
				extraction_result_input = extraction_result_input.concat(words.split(' '));
			});
			
			console.log("input keywords");
			console.log(extraction_result_input);
		}else{
			extraction_result_input =
	        keyword_extractor.extract(datainput,{
			    language:"english",
			    remove_digits: true,
			    return_changed_case:true,
			    remove_duplicates: false
		    });
			console.log("input keywords");
			console.log(extraction_result_input);
		}
			
		// cosine similarity with keywords
		var sim = [];
		results.forEach(alg => {
			sim.push({name: alg.name, cosineSimilarity: textCosineSimilarity2(alg.occurrences, extraction_result_input)});
		});
		sim.sort((a, b) => b.cosineSimilarity - a.cosineSimilarity);
		console.log("result");
		console.log(sim);
		return sim;
	}
    
	//-------------------------------------------------------------------------------------------- 
	// https://sumn2u.medium.com/string-similarity-comparision-in-js-with-examples-4bae35f13968
	//--------------------------------------------------------------------------------------------
	
	//can be removed
	function calculateTextCosineSimilarity(){
		var cosinesimilarities = [];
		this.infos.forEach(algorithminfo => {
			var applicationareaskeywords2 = []; 
			var problemtypeskeywords2 = [];
			algorithminfo.data.applicationAreas.forEach(word => {
				applicationareaskeywords2.push(word.label);
				applicationareaskeywords2.push(word.label);
				applicationareaskeywords2.push(word.label);
				applicationareaskeywords2.push(word.label);
			});
			algorithminfo.data.problemTypes.forEach(word => {
				problemtypeskeywords2.push(word.label);
				problemtypeskeywords2.push(word.label);
				problemtypeskeywords2.push(word.label);
				problemtypeskeywords2.push(word.label);
			});
			var wordarray = algorithminfo.data.intent.concat(algorithminfo.data.intent).concat(algorithminfo.data.problem, algorithminfo.data.solution)
			              .concat(applicationareaskeywords2, problemtypeskeywords2);
			cosinesimilarities.push({name: algorithminfo.name, cosineSimilarity: this.textCosineSimilarity(wordarray, this.filter.value)});
		});
		console.log("cosinesimilarities for text:");
		console.log(cosinesimilarities);
		return cosinesimilarities;
		
	}
  
    function termFreqMap(str) {
        var words = str.split(' ');
        var termFreq = {};
        words.forEach(function(w) {
            termFreq[w] = (termFreq[w] || 0) + 1;
        });
        return termFreq;
    }
	
	function termFreqMap2(array) {
        var termFreq = {};
        array.forEach(function(w) {
            termFreq[w] = (termFreq[w] || 0) + 1;
        });
        return termFreq;
    }

    function addKeysToDict(map, dict) {
        for (var key in map) {
            dict[key] = true;
        }
    }

    function termFreqMapToVector(map, dict) {
        var termFreqVector = [];
        for (var term in dict) {
            termFreqVector.push(map[term] || 0);
        }
        return termFreqVector;
    }

    function vecDotProduct(vecA, vecB) {
        var product = 0;
        for (var i = 0; i < vecA.length; i++) {
            product += vecA[i] * vecB[i];
        }
        return product;
    }

    function vecMagnitude(vec) {
        var sum = 0;
        for (var i = 0; i < vec.length; i++) {
            sum += vec[i] * vec[i];
        }
        return Math.sqrt(sum);
    }

    function cosineSimilarity(vecA, vecB) {
        return vecDotProduct(vecA, vecB) / (vecMagnitude(vecA) * vecMagnitude(vecB));
    }

    function textCosineSimilarity(strA, strB) {
        var termFreqA = this.termFreqMap(strA);
        var termFreqB = this.termFreqMap(strB);

        var dict = {};
        addKeysToDict(termFreqA, dict);
        addKeysToDict(termFreqB, dict);

        var termFreqVecA = this.termFreqMapToVector(termFreqA, dict);
        var termFreqVecB = this.termFreqMapToVector(termFreqB, dict);

        return this.cosineSimilarity(termFreqVecA, termFreqVecB);
    }
	
	function textCosineSimilarity2(occurences, input) {
        var termFreqB = termFreqMap2(input);

        var dict = {};
        addKeysToDict(occurences, dict);
        addKeysToDict(termFreqB, dict);

        var termFreqVecA = termFreqMapToVector(occurences, dict);
        var termFreqVecB = termFreqMapToVector(termFreqB, dict);

        return cosineSimilarity(termFreqVecA, termFreqVecB);
    }	
