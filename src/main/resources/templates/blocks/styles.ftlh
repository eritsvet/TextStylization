<#macro glassCard>
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
</#macro> 