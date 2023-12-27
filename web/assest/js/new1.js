let baseURL = 'http://localhost:9999/websell';
let current = 2;

function getNew1(cb) {
    fetch(`${baseURL}/newsapi?page=2`)
        .then(function (response) {
            return response.json();
        })
        .then(cb);
}

function createNew1(data, cb) {
    fetch(`${baseURL}/newsapi?page=2`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
    })
        .then(function (response) {
            return response.json();
        })
        .then(cb);
}

function start() {
    getNew1(renderNew);
    handleCreateForm();
}
start();
function renderNew(news) {
    let listNew1 = document.querySelector('.content-news1');
    let listNew2 = document.querySelector('.news2-content');
    let checkDelete = document.querySelector('.create-newpp');
    let htmls1 = news.map((news, id) => {
        return `
        <div class="recommend-news">
            <div class="date-news">
                <span class="post-date-day">${news.date}</span>
            </div>
            <a href="${news.link}"
                ><img
                src="${news.image}"
                alt=""
            /></a>
        <div class="content-news--new">
        <div class="content-news--new-1">
            <a href="${news.link}">
                <h4>
                    ${news.title}
                </h4>
            </a>
            <a href="${news.link}">
                <p>
                    ${news.desc}
                </p>
            </a>
        </div>
            ${
                checkDelete?
                `<div class="delete">
                    <a href="/websell/newsdelete?idnews=${news.id}">
                        Xóa
                    </a>
                </div>`:''
            }
            
        </div>
            
        </div>
        `;
    });
    listNew1.innerHTML = htmls1.join('');
    let htmls2 = news.map((news, id) => {
        return `
        <div class="blog-post">
            <img
                src="${news.image}"
                alt=""
            />
            <a href="${news.link}"
                ><p>
                    ${news.title}
                </p></a
            >
        </div>
        `;
    });
    listNew2.innerHTML = htmls2.join('');
}
function handleCreateForm() {
    var createBtn = document.querySelector('#Create-new1');
    createBtn.addEventListener('click', () => {
        let date = document.querySelector('#news-date').value;
        let title = document.querySelector('#news-title').value;
        let image = document.querySelector('#news-image').value;
        let desc = document.querySelector('#news-desc').value;
        let link = document.querySelector('#news-link').value;
        console.log(date, title, image, desc);
        let formData = {
            date,
            title,
            image,
            desc,
            link
        };
        createNew1(formData, function () {
            getNew1(renderNew);
        });
    });
}
 handleCreateForm();