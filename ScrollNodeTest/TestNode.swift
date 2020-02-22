//
//  TestNode.swift
//  ScrollNodeTest
//
//  Created by Nikita Arutyunov on 2/22/20.
//  Copyright © 2020 nickaroot. All rights reserved.
//

import AsyncDisplayKit

class TestNode: ASDisplayNode {
    let testOutScrollNode1: ASDisplayNode = {
        let node = ASDisplayNode()
        
        node.style.preferredLayoutSize = ASLayoutSize(
            width: ASDimension(unit: .fraction, value: 1),
            height: ASDimension(unit: .points, value: 60)
        )
        
        node.backgroundColor = .blue
        
        return node
    }()
    
    let testInScrollNode1: ASDisplayNode = {
        let node = ASDisplayNode()
        
        node.style.preferredLayoutSize = ASLayoutSize(
            width: ASDimension(unit: .points, value: 60),
            height: ASDimension(unit: .points, value: 1200)
        )
        
        node.backgroundColor = .brown
        
        return node
    }()
    
    let scrollNode: ASScrollNode = {
        let node = ASScrollNode()
        
        node.automaticallyManagesSubnodes = true
        node.automaticallyManagesContentSize = true
        
        node.style.preferredLayoutSize = ASLayoutSize(
            width: ASDimension(unit: .fraction, value: 1),
            height: ASDimensionAuto
        )
        
        node.style.flexShrink = 1.0
        
        node.backgroundColor = .yellow
        
        return node
    }()
    
    override required init() {
        super.init()
        
        automaticallyManagesSubnodes = true
        insetsLayoutMarginsFromSafeArea = true
        automaticallyRelayoutOnLayoutMarginsChanges = true
        
        backgroundColor = .green
        
        scrollNode.layoutSpecBlock = { _, _ in
            let stack = ASStackLayoutSpec.vertical()
            
            stack.children = [self.testInScrollNode1]
            
            return stack
        }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stack = ASStackLayoutSpec.vertical()
        
        stack.children = [
            testOutScrollNode1,
            scrollNode,
        ]
        
        return stack
    }
}
