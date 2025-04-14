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
        .table {
            color: white;
            background: transparent;
        }
        .table th {
            border-top: none;
            border-bottom: 2px solid rgba(255, 255, 255, 0.3);
            background: transparent;
            color: white;
        }
        .table td {
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            vertical-align: middle;
            background: transparent;
            color: white;
        }
        .table tbody tr:hover {
            background: rgba(255, 255, 255, 0.05);
        }
        .btn-light {
            background-color: rgba(255, 255, 255, 0.8);
            border: none;
        }
        .btn-light:hover {
            background-color: rgba(255, 255, 255, 1);
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
            <h1 class="text-center mb-4">Admin Panel</h1>
            <hr>
            
            <!-- Download Statistics Section -->
            <div class="row mb-4">
                <div class="col-md-12">
                    <div class="glass-card p-4">
                        <h3 class="text-white mb-3">Download Statistics</h3>
                        <div class="d-flex align-items-center">
                            <i class="fas fa-download fa-2x text-white me-4"></i>
                            <div>
                                <h4 class="text-white mb-2">Total Downloads</h4>
                                <p class="text-white mb-0">${totalDownloads} downloads</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-12">
                    <h3 class="text-white text-center mb-3">Users</h3>
                    <div class="glass-card p-4">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Email</th>
                                        <th>Name</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <#list users as user>
                                        <tr>
                                            <td>${user.id}</td>
                                            <td>${user.email}</td>
                                            <td>${user.name}</td>
                                            <td>
                                                <#if user.active>
                                                    <span class="text-success">Active</span>
                                                <#else>
                                                    <span class="text-danger">Banned</span>
                                                </#if>
                                            </td>
                                            <td>
                                                <a href="/admin/user/edit/${user.id}" class="btn btn-light btn-sm">Edit</a>
                                                <form action="/admin/user/ban/${user.id}" method="post" style="display: inline;">
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                    <button type="submit" class="btn btn-danger btn-sm">Ban</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@t.template>