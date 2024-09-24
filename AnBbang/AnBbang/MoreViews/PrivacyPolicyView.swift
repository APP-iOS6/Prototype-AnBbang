//
//  PrivacyPolicyView.swift
//  AnBbang
//
//  Created by Hwang_Inyoung on 9/24/24.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("개인정보 처리방침")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                Text("""
                        1. 개인정보의 처리 목적
                        '회사명'은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.
                        
                        - 회원 가입 및 관리
                        - 고객 상담 및 문의 대응
                        - 서비스 제공 및 관리
                        
                        2. 개인정보의 처리 및 보유 기간
                        회사는 정보주체로부터 개인정보를 수집할 때 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.
                        
                        - 회원탈퇴 후 1년간 보관
                        
                        3. 개인정보의 제3자 제공
                        회사는 정보주체의 개인정보를 제1항의 범위 내에서만 처리하며, 정보주체의 동의가 있는 경우에만 제3자에게 개인정보를 제공할 수 있습니다.
                        
                        4. 개인정보 처리의 위탁
                        회사는 원활한 개인정보 업무처리를 위하여 외부에 개인정보 처리를 위탁할 수 있으며, 그 위탁 사항에 대해 정보주체에게 사전 고지하고 동의를 구합니다.
                        
                        5. 정보주체의 권리
                        정보주체는 언제든지 개인정보 열람, 정정, 삭제 요청 등의 권리를 행사할 수 있으며, 이를 위해 회사는 신속히 조치하겠습니다.
                        
                        6. 개인정보의 파기
                        회사는 개인정보 보유기간의 경과, 처리 목적 달성 등 개인정보가 불필요하게 되었을 때에는 해당 정보를 지체 없이 파기합니다.
                        
                        더 자세한 내용은 회사의 개인정보 처리방침 전문을 참조하십시오.
                        """)
                .font(.body)
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("개인정보 처리방침")
        .modifier(BackButtonModifier())
    }
}

