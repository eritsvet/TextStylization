<#import "blocks/template.ftlh" as t>
<#import "blocks/styles.ftlh" as s>

<@t.template user>
    <style>
        <@s.glassCard/>
    </style>
    <div class="container mt-5">
        <div class="glass-card">
            <h1 class="text-center mb-4">Registration</h1>
            <hr>
            <form action="/registration" method="post">
                <div class="form-group">
                    <label for="name" class="text-white">Username</label>
                    <input type="text" class="form-control" required id="name" name="name">
                </div>
                <div class="form-group">
                    <label for="email" class="text-white">Email</label>
                    <input type="email" class="form-control" id="email" required name="email">
                </div>
                <div class="form-group">
                    <label for="password" class="text-white">Password</label>
                    <input type="password" class="form-control" id="password" required name="password">
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-light btn-block mt-4">Register</button>
            </form>
            <#if errorMessage??>
                <div class="alert alert-danger mt-3" role="alert">
                    ${errorMessage}
                </div>
            </#if>
            <hr>
            <div class="text-center">
                <p class="text-white mb-0">Already have an account? <a href="/login" class="text-info" style="text-decoration: none;">Login here!</a></p>
            </div>
        </div>
    </div>
</@t.template>