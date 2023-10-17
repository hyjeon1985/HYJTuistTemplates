//
//  sdk.swift
//  ProjectDescriptionHelpers
//
//  Created by Hoyeol Jeon on 10/16/23.
//

import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

let workspacePath = "."

let helperPath = "Tuist/ProjectDescriptionHelpers"
let templatesPath = "Tuist/Templates"
let examplePath = "\(nameAttribute)/Example"
let sdkPath = "\(nameAttribute)/SDK"
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
            path: helperPath + "/Project+InfoPlist.swift",
            templatePath: "Tuist/Project+InfoPlist.stencil"
        ),
        .file(
            path: helperPath + "/Target+uFeature.swift",
            templatePath: "Tuist/Target+uFeature.stencil"
        ),
        .file(
            path: helperPath + "/Project+uFeature.swift",
            templatePath: "Tuist/Project+uFeature.stencil"
        ),
        .file(
            path: helperPath + "/Project+Dependency.swift",
            templatePath: "Tuist/Project+Dependency.stencil"
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

        // Example
        .file(
            path: examplePath + "/Project.swift",
            templatePath: "Example/ExampleProject.stencil"
        ),
        .file(
            path: examplePath + "/Sources/ExampleApp.swift",
            templatePath: "Example/ExampleApp.stencil"
        ),
        .file(
            path: examplePath + "/Sources/ContentView.swift",
            templatePath: toolPath("ContentView.stencil")
        ),
        .file(
            path: examplePath + "/Resources/LaunchScreen.storyboard",
            templatePath: toolPath("LaunchScreen.stencil")
        ),
        .directory(
            path: examplePath + "/Resources",
            sourcePath: toolPath("Assets.xcassets")
        ),
        .directory(
            path: examplePath + "/Resources",
            sourcePath: toolPath("Preview Content")
        ),
            
        // SDK
        .file(
            path: sdkPath + "/Project.swift",
            templatePath: "SDKProject.stencil"
        ),
        .file(
            path: sdkPath + "/Sources/\(nameAttribute).swift",
            templatePath: "Namespace.stencil"
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
    description: "SDK Workspace Template... The Micro Feature Architecture is adopted.",
    attributes: [
        nameAttribute
    ],
    items: templateItems()
)
