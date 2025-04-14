<#import "blocks/template.ftlh" as t>
<#import "blocks/styles.ftlh" as s>

<@t.template user>
    <style>
        <@s.glassCard/>
    </style>
    <div class="container mt-5">
        <div class="glass-card">
            <h1 class="text-center mb-4">Login</h1>
            <hr>
            <form action="/login" method="post">
                <div class="form-group">
                    <label for="email" class="text-white">Email</label>
                    <input type="email" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="email" name="username" required>
                    <div id="email" class="invalid-feedback">
                        Invalid email or password
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="text-white">Password</label>
                    <input type="password" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="password" name="password" required>
                    <div id="password" class="invalid-feedback">
                        Invalid email or password
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-light btn-block mt-4">Login</button>
            </form>
            <hr>
            <div class="text-center">
                <p class="text-white mb-0">Don't have an account? <a href="/registration" class="text-info" style="text-decoration: none;">Register now!</a></p>
            </div>
        </div>
    </div>
</@t.template>