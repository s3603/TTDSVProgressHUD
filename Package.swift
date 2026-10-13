// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TTDProgressHUD",
    platforms: [
        .iOS(.v11),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "TTDProgressHUD",
            targets: ["TTDProgressHUD"]
        )
    ],
    targets: [
        .target(
            name: "TTDProgressHUD",
            dependencies: [],
            path: "SVProgressHUD",
            exclude: ["TTDProgressHUD-Prefix.pch"],
            resources: [
                .copy("TTDProgressHUD.bundle"),
                .copy("PrivacyInfo.xcprivacy")
            ],
            publicHeadersPath: "include"
        )
    ]
)
