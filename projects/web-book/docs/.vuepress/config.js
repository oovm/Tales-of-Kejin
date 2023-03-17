module.exports = {
    dest: 'docs/.build',
    locales: {
        '/': {
            lang: 'zh-CN',
            title: '氪皇默示录',
            lastUpdated: 'Last Updated',
        }
    },
    head: [
        ['link', { rel: 'shortcut icon', type: "image/x-icon", href: './favicon.png' }]
    ],
    themeConfig: {
        repo: 'GalAster/EulerProject',
        editLinks: true,
        docsDir: 'docs',
        markdown: {
            lineNumbers: true
        },
        sidebar: [
            {
                title: '前言',
                collapsable: true,
                children: [
                    ['/preface/', '前言'],
                ]
            },
            {
                title: '伪随机机制',
                collapsable: true,
                children: [
                    ['/pseudo-random/', '伪随机简介'],
                    ['/pseudo-random/pseudo-random-distribution.md', '伪随机分布'],
                    ['/pseudo-random/delayed-guarantee-system.md', '延迟保底制'],
                    ['/pseudo-random/functions.md', '相关函数'],
                ]
            },
            {
                title: '卡牌收集养成',
                collapsable: true,
                children: [
                    ['/card-collection/', '卡牌收集系统'],
                ]
            },
            {
                title: '附录',
                collapsable: true,
                children: [
                    ['/appendix/mathematica-tutorial.md', 'Mathematica 教程'],
                ]
            },
        ]
    },
    serviceWorker: true,
    markdown: {
        config: md => {
        }
    },
    plugins: {
        mathjax: {
            target: 'chtml',
            presets: [],
        },
    }
};
