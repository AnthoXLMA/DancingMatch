import Siema from 'siema';

const initSiema = () => {
    const slider = document.querySelector('.siema');
    if (slider) {
        let startIndex = 0;
        const skillsToCompleteCount = document.querySelectorAll('.skill-card[data-skill-completed=false]').length;
        const firstUncompletedSkillIndex = Array.from(document.querySelectorAll('.skill-card')).findIndex((card) => {
            return card.dataset.skillCompleted === 'false'
        });
        if (firstUncompletedSkillIndex !== -1) { // si la function findIndex a trouve un element
            startIndex = firstUncompletedSkillIndex;
        }
        const siema = new Siema({ startIndex });
        document.querySelector('.prev').addEventListener('click', (event) => {
            event.preventDefault();
            // on prev slide, hide profile update button and display next button
            if (siema.currentSlide == skillsToCompleteCount - 1) {
                document.querySelector('.profile-update-btn').classList.add('d-none');
                document.querySelector('.btn-pn.next').classList.remove('d-none');
            }

            siema.prev()
        });
        document.querySelector('.next').addEventListener('click', (event) => {
            event.preventDefault();
            siema.next()

            // on last slide, display profile update button and hide prev button
            if (siema.currentSlide == skillsToCompleteCount - 1) {
                document.querySelector('.profile-update-btn').classList.remove('d-none');
                document.querySelector('.btn-pn.next').classList.add('d-none');
            }
        });
    }
};

export { initSiema };
