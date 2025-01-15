document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('dancerForm');

    form.addEventListener('submit', (event) => {
        // Get form values
        const username = document.getElementById('username').value;
        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;
        const danceStyles = document.getElementById('danceStyles').selectedOptions;
        const level = document.getElementById('level').value;
        const location = document.getElementById('location').value;
        const bio = document.getElementById('bio').value;

        // Validate form fields
        if (!username || !email || !password || !danceStyles.length || !level || !location || !bio) {
            alert('Please fill in all fields.');
            event.preventDefault();
        } else {
            // Form is valid, submit it (here you can send the data to a server)
            alert('Registration successful!');
        }
    });
});
