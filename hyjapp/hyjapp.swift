//
//  hyjapp.swift
//  ProjectDescriptionHelpers
//
//  Created by Hoyeol Jeon on 10/16/23.
//

import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

let workspacePath = "."

let helperPath = "Tuist/ProjectDescriptionHelpers"
let templatesPath = "Tuist/Templates"
let appPath = "\(nameAttribute)/\(nameAttribute)"
let commonPath = "\(nameAttribute)/Common"

func toolPath(_ path: String) -> Path {
    "Tools/\(path)"
}

func templateItems() -> [Template.Item] {
    
    return [
        // Workspace
        .file(
            path: workspacePath + "/Workspace.swift",
            templatePath: "Workspace.stencil"
        ),
        
        // Tuist Helpers
        .file(
            path: helperPath + "/Project+BuildType.swift",
            templatePath: "Tuist/Project+BuildType.stencil"
        ),
        .file(
            path: helperPath + "/Project+Configurations.swift",
            templatePath: "Tuist/Project+Configurations.stencil"
        ),
        .file(
            path: helperPath + "/Project+Dependency.swift",
            templatePath: "Tuist/Project+Dependency.stencil"
        ),
        .file(
            path: helperPath + "/Project+InfoPlist.swift",
            templatePath: "Tuist/Project+InfoPlist.stencil"
        ),
        .file(
            path: helperPath + "/Project+Schemes.swift",
            templatePath: "Tuist/Project+Schemes.stencil"
        ),
        .file(
            path: helperPath + "/Project+Settings.swift",
            templatePath: "Tuist/Project+Settings.stencil"
        ),
        .file(
            path: helperPath + "/Project+uFeature.swift",
            templatePath: "Tuist/Project+uFeature.stencil"
        ),
        .file(
            path: helperPath + "/Target+uFeature.swift",
            templatePath: "Tuist/Target+uFeature.stencil"
        ),


        // Tuist Templates (uFeature Support)
        .directory(
            path: templatesPath,
            sourcePath: "Feature/feature"
        ),
        .file(
            path: templatesPath + "/feature/feature.swift",
            templatePath: "Feature/feature.stencil"
        ),

        // Tuist Dependencies (with TCA)
        .file(
            path: "Tuist/Dependencies.swift",
            templatePath: toolPath("TCADependencies.stencil")
        ),

        // Tuist Config
        .file(
            path: "Tuist/Config.swift",
            templatePath: toolPath("EmptyConfig.stencil")
        ),

        // App
        .file(
            path: appPath + "/Project.swift",
            templatePath: "App/AppProject.stencil"
        ),
        .file(
            path: appPath + "/Sources/{{ name }}App.swift",
            templatePath: "App/App.stencil"
        ),
        .file(
            path: appPath + "/Sources/ContentView.swift",
            templatePath: toolPath("ContentView.stencil")
        ),
        .file(
            path: appPath + "/Resources/LaunchScreen.storyboard",
            templatePath: toolPath("LaunchScreen.stencil")
        ),
        .directory(
            path: appPath + "/Resources",
            sourcePath: toolPath("Assets.xcassets")
        ),
        .directory(
            path: appPath + "/Resources",
            sourcePath: toolPath("Preview Content")
        ),
        
        // Common
        .file(
            path: commonPath + "/Project.swift",
            templatePath: "Common/CommonProject.stencil"
        ),
        .file(
            path: commonPath + "/Sources/Common.swift",
            templatePath: "Common/CommonNamespace.stencil"
        ),
        .directory(
            path: commonPath,
            sourcePath: "Common/Sources"
        ),
        .directory(
            path: commonPath + "/Resources",
            sourcePath: toolPath("Assets.xcassets")
        ),
        
        
        // Misc.
        .file(
            path: ".gitignore",
            templatePath: toolPath("Gitignore.stencil")
        ),
    ]
}


let template = Template(
    description: "App Workspace Template... The Micro Feature Architecture is adopted.",
    attributes: [
        nameAttribute
    ],
    items: templateItems()
)
