//
//  ResidenceStore.swift
//  AnBbang
//
//  Created by Hyunwoo Shin on 9/24/24.
//

import Foundation
import Observation

@Observable
class ResidenceStore: ObservableObject {
    static var residences: [ResidenceInfo] = [
        ResidenceInfo(
            images: ["TempRoom", "TempRoom2", "TempRoom3"],
            residenceType: "원룸",
            subInfo: "고층, 10.15m², 관리비 7만원",
            registNumber: "12345678",
            registDate: "2024-09-24",
            realEstateAgent: RealEstateAgent(
                name: "LAB 5 공인중개사사무소",
                rating: 4.9),
            quickInfo: QuickInfo(
                adress: "경상북도 경산시 압량읍",
                monthlyRent: "월세 500/30",
                maintenanceCost: "관리비 7만원"
            ),
            maintenanceCost: MaintenanceCost(
                cost: "월 관리비 70,000원",
                detail: """
                        최근 1년 관리비 평균금액 기준으로 산정
                        - 부과방식 : 정액관리비
                        - 일반(공용)관리비 : 70,000원
                        - 인터넷 사용료 : 의뢰인 미제공
                        - 수도료: 의뢰인 미제공
                        - TV사용료 : 의뢰인 미제공
                        - 기타관리비 : 의뢰인 미제공
                        """),
            options: [
                Option(name: "세탁기", image: "refrigerator"),
                Option(name: "싱크대", image: "sink"),
                Option(name: "에어컨", image: "air.conditioner.horizontal"),
                Option(name: "신발장", image: "shoe.2"),
                Option(name: "옷장", image: "hanger"),
                Option(name: "침대", image: "bed.double"),
                Option(name: "가스렌지", image: "stove"),
                Option(name: "책상", image: "studentdesk"),
                
            ],
            roomDescription: """
                         이 방이 어쩌고 저쩌고 그래서 좋습니다.
                         옵션도 낭낭해요.
                         주차도 편안해요.
                         제가 살고싶을만큼!
                         """
        ),
    
        ResidenceInfo(
            images: ["TempRoom3", "TempRoom", "TempRoom2"],
            residenceType: "원룸",
            subInfo: "3층/4층, 30.15m², 관리비 17만원",
            registNumber: "98765432",
            registDate: "2024-09-24",
            realEstateAgent: RealEstateAgent(
                name: "LAB 5 공인중개사사무소",
                rating: 4.9),
            quickInfo: QuickInfo(
                adress: "경상북도 경산시 압량읍",
                monthlyRent: "월세 1000/45",
                maintenanceCost: "관리비 7만원"
            ),
            maintenanceCost: MaintenanceCost(
                cost: "월 관리비 170,000원",
                detail: """
                        최근 1년 관리비 평균금액 기준으로 산정
                        - 부과방식 : 정액관리비
                        - 일반(공용)관리비 : 170,000원
                        - 인터넷 사용료 : 의뢰인 미제공
                        - 수도료: 의뢰인 미제공
                        - TV사용료 : 의뢰인 미제공
                        - 기타관리비 : 의뢰인 미제공
                        """),
            options: [
                Option(name: "세탁기", image: "refrigerator"),
                Option(name: "싱크대", image: "sink"),
                Option(name: "에어컨", image: "air.conditioner.horizontal"),
                Option(name: "신발장", image: "shoe.2"),
                Option(name: "옷장", image: "hanger"),
                Option(name: "침대", image: "bed.double"),
                Option(name: "가스렌지", image: "stove"),
                Option(name: "책상", image: "studentdesk"),
                
            ],
            roomDescription: """
                         방이 깔끔해요!
                         바퀴벌레도 없어요!
                         쥐도 없는것 같아요!
                         햇볕도 끝내줍니다
                         """
        )
    ]
    
}
