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
    var residences: [ResidenceInfo] = [
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
                address: "경상북도 경산시 압량읍",
                monthlyRent: "월세 30/500",
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
            isFavorite: false,
            isFemaleOnly: true,
            subInfo: "3층/4층, 30.15m², 관리비 17만원",
            registNumber: "98765432",
            registDate: "2024-09-24",
            realEstateAgent: RealEstateAgent(
                name: "LAB 5 공인중개사사무소",
                rating: 4.9),
            quickInfo: QuickInfo(
                address: "경상북도 경산시 압량읍",
                monthlyRent: "월세 45/1000",
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
        ),
        
        ResidenceInfo(
                images: ["TempRoom2", "TempRoom", "TempRoom3"],
                residenceType: "원룸",
                isFavorite: true,
                isFemaleOnly: true,
                subInfo: "2층/4층, 25.00m², 관리비 15만원",
                registNumber: "12345678",
                registDate: "2024-09-24",
                realEstateAgent: RealEstateAgent(
                    name: "ABC 부동산",
                    rating: 4.8
                ),
                quickInfo: QuickInfo(
                    address: "서울특별시 마포구",
                    monthlyRent: "월세 80/50",
                    maintenanceCost: "관리비 5만원"
                ),
                maintenanceCost: MaintenanceCost(
                    cost: "월 관리비 150,000원",
                    detail: """
                            최근 1년 관리비 평균금액 기준으로 산정
                            - 부과방식 : 정액관리비
                            - 일반(공용)관리비 : 150,000원
                            """
                ),
                options: [
                    Option(name: "세탁기", image: "washingmachine"),
                    Option(name: "냉장고", image: "refrigerator"),
                    Option(name: "에어컨", image: "air.conditioner.horizontal"),
                    Option(name: "책상", image: "studentdesk"),
                ],
                roomDescription: """
                             방이 깔끔하고 넓어요!
                             조용한 동네입니다.
                             """
            ),
            ResidenceInfo(
                images: ["TempRoom", "TempRoom2", "TempRoom3"],
                residenceType: "투룸",
                isFavorite: false,
                isFemaleOnly: false,
                subInfo: "1층/3층, 45.00m², 관리비 10만원",
                registNumber: "87654321",
                registDate: "2024-09-23",
                realEstateAgent: RealEstateAgent(
                    name: "XYZ 공인중개사사무소",
                    rating: 4.7
                ),
                quickInfo: QuickInfo(
                    address: "부산광역시 해운대구",
                    monthlyRent: "월세 120/400",
                    maintenanceCost: "관리비 3만원"
                ),
                maintenanceCost: MaintenanceCost(
                    cost: "월 관리비 100,000원",
                    detail: """
                            관리비 포함 사항 안내드립니다.
                            - 부과방식 : 정액관리비
                            """
                ),
                options: [
                    Option(name: "가스렌지", image: "stove"),
                    Option(name: "신발장", image: "shoe.2"),
                    Option(name: "옷장", image: "hanger"),
                ],
                roomDescription: """
                             조용하고 아늑한 방입니다.
                             가족과 함께 살기에 좋습니다.
                             """
            ),
            ResidenceInfo(
                images: ["TempRoom3", "TempRoom1", "TempRoom2"],
                residenceType: "원룸",
                isFavorite: false,
                isFemaleOnly: true,
                subInfo: "3층/5층, 35.00m², 관리비 12만원",
                registNumber: "13579246",
                registDate: "2024-09-22",
                realEstateAgent: RealEstateAgent(
                    name: "Sunny 부동산",
                    rating: 5.0
                ),
                quickInfo: QuickInfo(
                    address: "경기도 성남시 분당구",
                    monthlyRent: "월세 90/300",
                    maintenanceCost: "관리비 7만원"
                ),
                maintenanceCost: MaintenanceCost(
                    cost: "월 관리비 120,000원",
                    detail: """
                            관리비 내역은 추후 안내 드리겠습니다.
                            """
                ),
                options: [
                    Option(name: "에어컨", image: "air.conditioner.horizontal"),
                    Option(name: "침대", image: "bed.double"),
                    Option(name: "냉장고", image: "refrigerator"),
                ],
                roomDescription: """
                             아늑하고 편안한 방입니다.
                             햇볕이 잘 들어옵니다.
                             """
            ),
            ResidenceInfo(
                images: ["TempRoom2", "TempRoom", "TempRoom3"],
                residenceType: "투룸",
                isFavorite: false,
                isFemaleOnly: false,
                subInfo: "5층/5층, 50.00m², 관리비 14만원",
                registNumber: "24681357",
                registDate: "2024-09-21",
                realEstateAgent: RealEstateAgent(
                    name: "Dream 부동산",
                    rating: 4.6
                ),
                quickInfo: QuickInfo(
                    address: "인천광역시 남동구",
                    monthlyRent: "월세 110/350만원",
                    maintenanceCost: "관리비 6만원"
                ),
                maintenanceCost: MaintenanceCost(
                    cost: "월 관리비 140,000원",
                    detail: """
                            이사는 쉽게 하실 수 있습니다.
                            """
                ),
                options: [
                    Option(name: "세탁기", image: "washingmachine"),
                    Option(name: "책상", image: "studentdesk"),
                    Option(name: "신발장", image: "shoe.2"),
                ],
                roomDescription: """
                             가족과 함께 살기에 적합합니다.
                             편리한 시설이 인근에 있습니다.
                             """
            ),
            ResidenceInfo(
                images: ["TempRoom", "TempRoom2", "TempRoom3"],
                residenceType: "원룸",
                isFavorite: false,
                isFemaleOnly: true,
                subInfo: "4층/6층, 30.00m², 관리비 8만원",
                registNumber: "36925814",
                registDate: "2024-09-20",
                realEstateAgent: RealEstateAgent(
                    name: "Harmony 부동산",
                    rating: 4.9
                ),
                quickInfo: QuickInfo(
                    address: "대전광역시 서구",
                    monthlyRent: "월세 75/250",
                    maintenanceCost: "관리비 4만원"
                ),
                maintenanceCost: MaintenanceCost(
                    cost: "월 관리비 80,000원",
                    detail: """
                            저렴한 관리비로 제공합니다.
                            """
                ),
                options: [
                    Option(name: "에어컨", image: "air.conditioner.horizontal"),
                    Option(name: "침대", image: "bed.double"),
                ],
                roomDescription: """
                             깔끔하고 편리한 원룸입니다.
                             여성 전용입니다.
                             """
            )
    ]
    
    var favoritesResidences: [ResidenceInfo] = []
    
    func initFavoritesResidences() {
        favoritesResidences = residences.filter { $0.isFavorite }
    }
    
    func getFavorites(id: UUID) -> Bool{
        for index in 0..<residences.count {
            if residences[index].id == id {
                return residences[index].isFavorite
            }
        }
        
        return false
    }
    
    func toggleFavorite(id: UUID) {
        let triggerDate = Calendar.current.date(byAdding: .second, value: 10, to: Date())!
        let date = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: triggerDate)
        
        for index in 0 ..< residences.count {
            if residences[index].id == id {
                if residences[index].isFavorite {
                    residences[index].isFavorite = false
                    
                    LocalNotificationManager.shared.deleteNotification(id: residences[index].id.uuidString)
                } else {
                    residences[index].isFavorite = true
                    
                    LocalNotificationManager.shared.addNewNotification(
                        notification: Notification(id: residences[index].id.uuidString, title: "새 매물 알림🏡", body: "즐겨찾기 하신 매물이 업데이트 되었어요!", notificationDate: date)
                    )
                }
            }
        }
    }
    
    func addFavoriteResidence(residence: ResidenceInfo) {
        favoritesResidences.append(residence)
    }
    
    func subFavoriteResidence(id: UUID) {
        for index in 0..<favoritesResidences.count {
            if favoritesResidences[index].id == id {
                favoritesResidences.removeAll { $0.id == id }
            }
        }
    }
    
    func findResidence(id: UUID) -> ResidenceInfo {
        for index in 0..<favoritesResidences.count {
            if favoritesResidences[index].id == id {
                return favoritesResidences[index]
            } 
        }
        
        return favoritesResidences[0]
    }
}
