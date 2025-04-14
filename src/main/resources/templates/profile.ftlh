<#import "blocks/template.ftlh" as t>
<@t.template user>
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
        .btn-danger {
            background-color: rgba(220, 53, 69, 0.8);
            border: none;
        }
        .btn-danger:hover {
            background-color: rgba(220, 53, 69, 1);
        }
    </style>
    <div class="container mt-5">
        <div class="glass-card">
            <h1 class="text-center mb-4">Profile</h1>
            <hr>
            <div class="row">
                <div class="col-md-6">
                    <h3 class="text-white mb-3">User Information</h3>
                    <p class="text-white"><strong>Email:</strong> ${user.email}</p>
                    <p class="text-white"><strong>Name:</strong> ${user.name}</p>
                </div>
                <div class="col-md-6">
                    <h3 class="text-white mb-3">Actions</h3>
                    <form action="/profile/update" method="post" class="mb-3">
                        <div class="form-group">
                            <label for="name" class="text-white">Change Name</label>
                            <input type="text" class="form-control" id="name" name="name" value="${user.name}" required>
                        </div>
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button type="submit" class="btn btn-light btn-block mt-2">Update Name</button>
                    </form>
                    <form action="/logout" method="post" class="mb-3">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button type="submit" class="btn btn-light btn-block">Logout</button>
                    </form>
                </div>
            </div>
            <hr>
            <#if user.isAdmin()>
                <div class="text-center">
                    <a href="/admin" class="btn btn-light btn-block">Admin Panel</a>
                </div>
            </#if>
        </div>
    </div>
</@t.template>