<#import "blocks/template.ftlh" as t>
<#import "blocks/pager.ftlh" as p>

<@t.template user!>
    <style>
        .glass-card {
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.15), rgba(255, 255, 255, 0.1));
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 20px;
            padding: 3rem;
            color: white;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            margin-bottom: 2rem;
            position: relative;
            overflow: hidden;
        }
        .glass-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0.05));
            z-index: -1;
            border-radius: 20px;
        }
        .glass-card h1 {
            font-weight: 500;
            margin-bottom: 1.5rem;
            color: white;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }
        .glass-card .lead {
            font-size: 1.3rem;
            font-weight: 400;
            margin-bottom: 1.5rem;
            color: white;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
        }
        .glass-card hr {
            border-top: 2px solid rgba(255, 255, 255, 0.3);
            margin: 2rem 0;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }
        .glass-card p {
            color: white;
            font-size: 1.2rem;
            line-height: 1.6;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
        }
        .presentation-title {
            color: #ffffff;
            text-align: center;
            margin: 2rem 0;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid #ffffff;
            font-size: 2rem;
            font-weight: 500;
        }
        .presentation-image {
            max-width: 100%;
            height: auto;
            margin: 1rem 0;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .image-caption {
            color: #ffffff;
            text-align: center;
            margin-bottom: 2rem;
            font-size: 1.1rem;
        }
        .comments-section {
            margin-top: 3rem;
            padding: 2rem;
            background: #343a40;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .comment-form {
            margin-bottom: 2rem;
        }
        .comment-form textarea {
            width: 100%;
            padding: 1rem;
            border-radius: 8px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            background: rgba(255, 255, 255, 0.1);
            color: white;
            margin-bottom: 1rem;
            resize: vertical;
            min-height: 60px;
            max-height: 200px;
        }
        .comment-form textarea::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }
        .comment {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
            position: relative;
            max-width: 100%;
            overflow: hidden;
        }
        .comment-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
            color: rgba(255, 255, 255, 0.8);
        }
        .comment-author {
            font-weight: 500;
            color: white;
        }
        .comment-date {
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.6);
        }
        .comment-text {
            color: white;
            line-height: 1.6;
            padding-right: 1rem;
            margin-bottom: 2.5rem;
            max-width: 100%;
            word-wrap: break-word;
            overflow-wrap: break-word;
        }
        .login-message {
            text-align: center;
            padding: 1rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 8px;
            margin-bottom: 2rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .delete-comment-btn {
            position: absolute;
            bottom: 1.2rem;
            right: 1.5rem;
            padding: 0.25rem 0.5rem;
            font-size: 0.8rem;
            background-color: rgba(0, 0, 0, 0.5);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            transition: all 0.3s ease;
        }
        .delete-comment-btn:hover {
            background-color: rgba(0, 0, 0, 0.7);
            border-color: rgba(255, 255, 255, 0.3);
            color: white;
        }
    </style>

    <div class="container mt-5">
        <div class="glass-card">
            <h1 class="display-4">Welcome to Text Stylization</h1>
            <p class="lead">Transform your text with our powerful styling tools</p>
            <hr>
            <p>Get started by downloading our application or following our tutorial.</p>
        </div>

        <h2 class="presentation-title">Presentation</h2>

        <div class="row">
            <div class="col-12 text-center">
                <img src="/static/images/multilayer.png" alt="Multilayer preset" class="presentation-image">
                <p class="image-caption">Multilayer preset</p>
            </div>
        </div>

        <div class="row">
            <div class="col-12 text-center">
                <img src="/static/images/round.png" alt="Round preset" class="presentation-image">
                <p class="image-caption">Round preset</p>
            </div>
        </div>

        <div class="row">
            <div class="col-12 text-center">
                <img src="/static/images/slime.png" alt="Slime preset" class="presentation-image">
                <p class="image-caption">Slime preset</p>
            </div>
        </div>

        <div class="comments-section" id="comments-section">
            <h3 class="text-white mb-4">Comments</h3>
            
            <#if error??>
                <div class="alert alert-danger" role="alert">
                    ${error}
                </div>
            </#if>
            
            <#if success??>
                <div class="alert alert-success" role="alert">
                    ${success}
                </div>
            </#if>
            
            <#if user?? && user.email??>
                <form class="comment-form" action="/comment/create" method="post" onsubmit="return handleFormSubmit(event)">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <textarea name="text" placeholder="Write your comment here..." required></textarea>
                    <button type="submit" class="btn btn-light">Submit Comment</button>
                </form>
            <#else>
                <div class="login-message">
                    <p class="text-white mb-0">Please <a href="/login" class="text-white">login</a> to leave a comment</p>
                </div>
            </#if>

            <div class="comments-list">
                <#if comments?? && comments.content?has_content>
                    <#list comments.content as comment>
                        <div class="comment">
                            <div class="comment-header">
                                <span class="comment-author">${comment.user.name}</span>
                                <span class="comment-date">${comment.dateOfCreated.format(dateFormatter)}</span>
                            </div>
                            <div class="comment-text">
                                ${comment.text}
                                <#if user?? && user.id?? && (user.id == comment.user.id || user.isAdmin())>
                                    <form action="/delete/${comment.id}" method="post" class="d-inline">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <button type="submit" class="delete-comment-btn" onclick="return confirm('Are you sure you want to delete this comment?')">
                                            <i class="fas fa-trash"></i> Delete
                                        </button>
                                    </form>
                                </#if>
                            </div>
                        </div>
                    </#list>
                <#else>
                    <div class="comment">
                        <div class="comment-text text-center">
                            No comments yet. Be the first to leave a comment!
                        </div>
                    </div>
                </#if>
            </div>

            <#if comments?? && comments.getTotalPages() gt 1>
                <@p.pager url="/" products=comments/>
            </#if>
        </div>
    </div>

    <script>
        // Сохраняем позицию прокрутки перед перезагрузкой страницы
        window.onbeforeunload = function() {
            sessionStorage.setItem('scrollPosition', window.scrollY);
        };

        // Восстанавливаем позицию прокрутки после загрузки страницы
        window.onload = function() {
            const scrollPosition = sessionStorage.getItem('scrollPosition');
            if (scrollPosition) {
                window.scrollTo(0, scrollPosition);
                sessionStorage.removeItem('scrollPosition');
            }
        };

        function handleFormSubmit(event) {
            event.preventDefault();
            const form = event.target;
            const formData = new FormData(form);
            
            fetch(form.action, {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (response.redirected) {
                    window.location.href = response.url;
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
            
            return false;
        }

        // Обработка кликов по ссылкам пагинации
        document.addEventListener('DOMContentLoaded', function() {
            const paginationLinks = document.querySelectorAll('.pagination a');
            paginationLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    if (this.href.includes('page=')) {
                        e.preventDefault();
                        const scrollPosition = window.scrollY;
                        sessionStorage.setItem('scrollPosition', scrollPosition);
                        window.location.href = this.href;
                    }
                });
            });
        });
    </script>
</@t.template>