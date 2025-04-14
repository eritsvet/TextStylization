<#macro pager url products>
    <#if products.getTotalPages() gt 1>
        <div class="pagination-container">
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <#if products.hasPrevious()>
                        <li class="page-item">
                            <a class="page-link" href="${url}?page=${products.getNumber() - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    <#else>
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </#if>
                    
                    <#list 1..products.getTotalPages() as page>
                        <#if page == products.getNumber() + 1>
                            <li class="page-item active">
                                <a class="page-link" href="#">${page}</a>
                            </li>
                        <#else>
                            <li class="page-item">
                                <a class="page-link" href="${url}?page=${page - 1}">${page}</a>
                            </li>
                        </#if>
                    </#list>
                    
                    <#if products.hasNext()>
                        <li class="page-item">
                            <a class="page-link" href="${url}?page=${products.getNumber() + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    <#else>
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </#if>
                </ul>
            </nav>
        </div>
    </#if>

    <style>
        .pagination-container {
            margin-top: 2rem;
            padding: 1rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .pagination {
            margin-bottom: 0;
        }
        .page-link {
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            padding: 0.5rem 1rem;
            margin: 0 0.2rem;
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        .page-link:hover {
            background-color: rgba(255, 255, 255, 0.2);
            border-color: rgba(255, 255, 255, 0.3);
            color: white;
        }
        .page-item.active .page-link {
            background-color: rgba(255, 255, 255, 0.3);
            border-color: rgba(255, 255, 255, 0.4);
            color: white;
        }
        .page-item.disabled .page-link {
            background-color: rgba(255, 255, 255, 0.05);
            border-color: rgba(255, 255, 255, 0.1);
            color: rgba(255, 255, 255, 0.3);
        }
    </style>
</#macro>