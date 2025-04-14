<#import "blocks/template.ftlh" as t>

<@t.template user!>
    <style>
        .tutorial-section {
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.15), rgba(255, 255, 255, 0.1));
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 20px;
            padding: 3rem;
            color: white;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            margin: 2rem 0;
        }
        .tutorial-section h1 {
            font-weight: 500;
            margin-bottom: 2rem;
            color: white;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .section {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 2rem;
            margin-bottom: 2rem;
        }
        .section h2 {
            color: white;
            margin-bottom: 1.5rem;
            font-size: 1.8rem;
            font-weight: 500;
            border-bottom: 2px solid rgba(255, 255, 255, 0.2);
            padding-bottom: 0.5rem;
        }
        .video-container {
            position: relative;
            padding-bottom: 56.25%; /* 16:9 Aspect Ratio */
            height: 0;
            overflow: hidden;
            margin-bottom: 2rem;
        }
        .video-container iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: none;
            border-radius: 10px;
        }
        .content {
            color: white;
            font-size: 1.1rem;
            line-height: 1.6;
        }
        .step {
            margin-bottom: 2rem;
        }
        .step img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            margin: 1rem auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            display: block;
        }
        .step-number {
            font-weight: bold;
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: 0.5rem;
        }
        .instruction-item {
            margin-bottom: 1.5rem;
            padding: 1.5rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            transition: transform 0.3s ease;
        }
        .instruction-item:hover {
            transform: translateY(-2px);
            background: rgba(255, 255, 255, 0.08);
        }
        .instruction-item img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            margin: 1rem auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            display: block;
        }
    </style>

    <div class="container mt-5">
        <div class="tutorial-section">
            <h1>Tutorial</h1>
            
            <div class="section">
                <h2>Video</h2>
                <div class="video-container">
                    <iframe src="https://www.youtube.com/embed/jxfM3_xm-JY?si=wmPXenGqlxuIGJZV"
                            title="Text Stylization Tutorial"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen>
                    </iframe>
                </div>
            </div>

            <div class="section">
                <h2>Enabling the addon</h2>
                <div class="content">
                    <div class="step">
                        <div class="step-number">1. Click Edit in the main header.</div>
                        <img src="/static/images/1.png" alt="Click Edit in the main header">
                    </div>

                    <div class="step">
                        <div class="step-number">2. Go to Preferences.</div>
                        <img src="/static/images/2.png" alt="Go to Preferences">
                    </div>

                    <div class="step">
                        <div class="step-number">3. Open the Add-ons tab.</div>
                        <img src="/static/images/3.png" alt="Open the Add-ons tab">
                    </div>

                    <div class="step">
                        <div class="step-number">4. Click the arrow in the top-right corner → Install from Disk.</div>
                        <img src="/static/images/4.png" alt="Click Install from Disk">
                    </div>

                    <div class="step">
                        <div class="step-number">5. Select the add-on .zip file and enable it.</div>
                        <img src="/static/images/5.png" alt="Select and enable the add-on">
                    </div>
                </div>
            </div>

            <div class="section">
                <h2>Using the addon</h2>
                <div class="content">
                    <div class="step">
                        <div class="step-number">1. Click the side arrow or press N to open the side panel.</div>
                        <img src="/static/images/6.png" alt="Open the side panel">
                    </div>

                    <div class="step">
                        <div class="step-number">2. Go to the Text Tools tab.</div>
                        <img src="/static/images/7.png" alt="Go to the Text Tools tab">
                    </div>

                    <div class="step">
                        <div class="step-number">3. Choose a font, enter your text, and click a preset button.</div>
                        <img src="/static/images/8.png" alt="Choose font and text">
                    </div>

                    <div class="step">
                        <div class="step-number">4. In the Modifier Properties tab, adjust the stylization settings.</div>
                        <img src="/static/images/9.png" alt="Adjust stylization settings">
                    </div>

                    <div class="step">
                        <div class="step-number">5. In the Material Properties tab, customize the material.</div>
                        <img src="/static/images/10.png" alt="Customize material">
                    </div>
                </div>
            </div>
        </div>
    </div>
</@t.template> 