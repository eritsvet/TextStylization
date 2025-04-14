<#import "blocks/template.ftlh" as t>

<@t.template user!>
    <style>
        .download-section {
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.15), rgba(255, 255, 255, 0.1));
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 20px;
            padding: 3rem;
            color: white;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            margin: 2rem 0;
            text-align: center;
        }
        .download-section h1 {
            font-weight: 500;
            margin-bottom: 2rem;
            color: white;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            text-align: center;
            font-size: 2.5rem;
        }
        .download-section h2 {
            color: white;
            margin-bottom: 1.5rem;
            font-size: 1.8rem;
            font-weight: 500;
            border-bottom: 2px solid rgba(255, 255, 255, 0.2);
            padding-bottom: 0.5rem;
        }
        .download-section p {
            color: white;
            font-size: 1.1rem;
            line-height: 1.6;
            margin-bottom: 1rem;
        }
        .download-btn {
            background: rgba(255, 255, 255, 0.2);
            border: 2px solid rgba(255, 255, 255, 0.3);
            color: white;
            padding: 1rem 2rem;
            font-size: 1.2rem;
            border-radius: 10px;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            margin-bottom: 3rem;
        }
        .download-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            border-color: rgba(255, 255, 255, 0.4);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
        .specs-section, .features-section {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 2rem;
            margin-bottom: 2rem;
            text-align: left;
        }
        .specs-section h2, .features-section h2 {
            color: white;
            margin-bottom: 1.5rem;
            font-size: 1.8rem;
            font-weight: 500;
            border-bottom: 2px solid rgba(255, 255, 255, 0.2);
            padding-bottom: 0.5rem;
        }
        .specs-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .specs-list li {
            margin: 1rem 0;
            padding: 0.5rem 0;
            color: white;
            font-size: 1.1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        .specs-list li:last-child {
            border-bottom: none;
        }
        .features-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .features-list li {
            margin: 1.5rem 0;
            padding: 1rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            color: white;
            font-size: 1.1rem;
            line-height: 1.6;
        }
        .feature-icon {
            font-size: 1.5rem;
            margin-right: 0.5rem;
            vertical-align: middle;
        }
    </style>

    <div class="container mt-5">
        <div class="download-section">
            <h1>Download Text Stylization</h1>
            <p>Get started with our powerful text styling tools today</p>
            <a href="/download/addon" class="download-btn">Download Now</a>
            
            <div class="specs-section">
                <h2>Specifications</h2>
                <ul class="specs-list">
                    <li><strong>Blender Version:</strong> 3.0.0 and above</li>
                    <li><strong>Platform Compatibility:</strong> Windows, macOS, Linux</li>
                    <li><strong>Addon Type:</strong> Text stylization and animation</li>
                    <li><strong>Interface Integration:</strong> Located in the N-Panel</li>
                    <li><strong>Release Date:</strong> April 10, 2025</li>
                    <li><strong>Author:</strong> Erika Tsvetkova</li>
                </ul>
            </div>

            <div class="features-section">
                <h2>Features</h2>
                <ul class="features-list">
                    <li><span class="feature-icon">🔤</span> 10 Procedural Text Presets<br>
                        <small>Addon includes 10 customizable text animation presets, generated using Geometry Nodes.</small></li>
                    <li><span class="feature-icon">✍️</span> Text Input & Font Selection<br>
                        <small>Easily input your own text and choose any installed font for stylization.</small></li>
                    <li><span class="feature-icon">🛠️</span> Modifier-Based Controls<br>
                        <small>Each preset is fully adjustable via the Modifier Properties tab, giving you flexible creative control.</small></li>
                    <li><span class="feature-icon">🎨</span> 20 Procedural Materials<br>
                        <small>Includes 20 Shader Nodes–based materials, also procedurally generated and customizable.</small></li>
                    <li><span class="feature-icon">🧱</span> Material Settings<br>
                        <small>All materials are edited directly in the Material Properties tab for quick and intuitive adjustments.</small></li>
                </ul>
            </div>
        </div>
    </div>
</@t.template> 