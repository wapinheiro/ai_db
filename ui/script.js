const questionInput = document.getElementById('question');
const answerOutput = document.getElementById('answer');
const okButton = document.getElementById('ok');
const askAnotherButton = document.getElementById('askAnother');
const loadingSpinner = document.getElementById('loadingSpinner');
const promptsBox = document.getElementById('prompts')
const sqlBox = document.getElementById('sql')
const accordions = document.querySelectorAll('.accordion');

let buttonClickedOnce = false; // flag to track clicks

okButton.addEventListener('click', function() {
    const question = questionInput.value;

    loadingSpinner.style.display = 'block'; 
    
    fetch('http://localhost:8080/ask_question', {//use por 5000 for localhost or 8080 for container
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ question: question })
    })
    .then(response => {
        if (!response.ok) { // Check for an error response
            okButton.textContent = 'Try Again';
            throw Error('LLM request failed'); // Will trigger catch
        }
        return response.json();
    })
    .then(data => {
        answerOutput.value = data.answer;
        promptsBox.value = data.prompt;
        sqlBox.value = data.sql_query;         
    })
    .catch(error => { 
        console.error('Error:', error); 
    })
    .finally(() => {
        loadingSpinner.style.display = 'none'; 
        buttonClickedOnce = true; // Set the flag after the first request
    });
});

askAnotherButton.addEventListener('click', function() {
    questionInput.value = ''; // Clear question
    answerOutput.value = '';  // Clear answer
    promptsBox.value = ''; // Clear prompts
    sqlBox.value = '' // Clear sql query
    okButton.textContent = 'Get Answer';
    questionInput.focus();    // Focus the question box
});

accordions.forEach(accordion => {
    accordion.addEventListener('click', function() {
        this.classList.toggle('active');

        // Find the corresponding panel
        const panel = this.nextElementSibling; 

        // Check if it's a panel (add null checks if needed)
        if (panel && panel.classList.contains('panel')) { 
            panel.classList.toggle('active');
        } 
    });
});





