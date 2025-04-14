<#import "blocks/template.ftlh" as t>

<@t.template user>
    <style>
        .edit-user-section {
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.15), rgba(255, 255, 255, 0.1));
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 20px;
            padding: 3rem;
            color: white;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            margin: 2rem auto;
            max-width: 600px;
            position: relative;
            overflow: hidden;
        }
        .edit-user-section::before {
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
        .edit-user-section h1 {
            font-weight: 500;
            margin-bottom: 2rem;
            color: white;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .edit-user-section hr {
            border-top: 2px solid rgba(255, 255, 255, 0.2);
            margin: 2rem 0;
        }
        .role-checkbox {
            margin-bottom: 1rem;
            padding: 0.5rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        .role-checkbox:hover {
            background: rgba(255, 255, 255, 0.1);
        }
        .role-checkbox label {
            color: white;
            font-weight: 500;
            margin-left: 0.5rem;
            cursor: pointer;
        }
        .role-checkbox input[type="radio"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }
        .btn-save {
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
            padding: 0.75rem 2rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            width: 100%;
            margin-top: 1rem;
        }
        .btn-save:hover {
            background: rgba(255, 255, 255, 0.3);
            border-color: rgba(255, 255, 255, 0.4);
            color: white;
        }
    </style>

    <div class="edit-user-section">
        <h1>Редактирование пользователя ${user.name}</h1>
        <hr>
        <form action="/admin/user/edit" method="post">
            <#list roles as role>
                <div class="role-checkbox">
                    <label>
                        <input type="radio" name="role" value="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>
                        ${role}
                    </label>
                </div>
            </#list>
            <input type="hidden" value="${user.id}" name="userId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="submit" class="btn-save">Сохранить</button>
        </form>
    </div>
</@t.template>