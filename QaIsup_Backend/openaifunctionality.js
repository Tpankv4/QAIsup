const { OpenAI } = require("openai");
require('dotenv').config();

module.exports = function(textinput) {
	
	const openai = new OpenAI({
		apiKey: process.env.OPENAI_API_KEY,
	});

	async function runCompletion (input) {
		try{
			const completion = await openai.chat.completions.create({
			model: "gpt-3.5-turbo",
			messages: [{role: "user", content: input}],
			});
			console.log("das hier muss gehen!");
			console.log(completion.choices[0].message);
			return completion;
		}
		catch(error){
			console.error(error);
			console.log("fehler... wahrscheinlich kein api key");
		}
	}
	
	return runCompletion(textinput);


}