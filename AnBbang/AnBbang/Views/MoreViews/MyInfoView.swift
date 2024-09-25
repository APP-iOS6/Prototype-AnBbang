//
//  MyInfoView.swift
//  AnBbang
//
//  Created by Hwang_Inyoung on 9/25/24.
//

//
//  MyInfoView.swift
//  AnBbang
//
//  Created by Hwang_Inyoung on 9/25/24.
//

//
//  MyInfoView.swift
//  AnBbang
//
//  Created by Hwang_Inyoung on 9/25/24.
//

import SwiftUI
import PhotosUI

// 내 정보 화면 구현
struct MyInfoView: View {
    @State private var profileImage: UIImage? // 선택한 프로필 사진
    @State private var showingImagePicker = false // 이미지 피커를 표시할지 여부
    @State private var socialAccount = "카카오 계정"
    @State private var nickname = "선녀의방"
    @State private var fullName = "5조"
    @State private var phoneNumber = "010-2424-7979"
    @Environment(\.presentationMode) var presentationMode // 화면 종료를 위한 변수
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            // 프로필 사진 섹션
            Button(action: {
                showingImagePicker = true
            }) {
                if let profileImage = profileImage {
                    Image(uiImage: profileImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                        .shadow(radius: 5)
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.gray)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                        .shadow(radius: 5)
                }
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $profileImage)
            }
            
            // 사용자 정보 섹션
            VStack(alignment: .leading, spacing: 10) {
                // 연결된 소셜 계정
                HStack {
                    Text("연결된 소셜 계정")
                        .font(.headline)
                    Spacer()
                    Text(socialAccount)
                }
                Divider()
                
                // 닉네임
                HStack {
                    Text("닉네임")
                        .font(.headline)
                    Spacer()
                    TextField("닉네임", text: $nickname)
                        .multilineTextAlignment(.trailing)
                }
                Divider()
                
                // 이름
                HStack {
                    Text("이름")
                        .font(.headline)
                    Spacer()
                    TextField("이름", text: $fullName)
                        .multilineTextAlignment(.trailing)
                }
                Divider()
                
                // 휴대폰 번호
                HStack {
                    Text("휴대폰 번호")
                        .font(.headline)
                    Spacer()
                    TextField("휴대폰 번호", text: $phoneNumber)
                        .keyboardType(.phonePad)
                        .multilineTextAlignment(.trailing)
                }
                Divider()
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity) // 화면 전체 너비를 차지하도록 설정
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            // 회원 탈퇴 버튼
            Button(action: {
                // 회원 탈퇴 로직 구현
            }) {
                Text("회원 탈퇴")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .padding()
            }
            
            Spacer()

            // 저장 및 취소 버튼 섹션
            HStack(spacing: 20) {
                // 저장 버튼
                Button(action: {
                    // 저장 로직 구현
                    saveChanges()
                    presentationMode.wrappedValue.dismiss() // 현재 화면을 닫고 이전 화면으로 돌아가기
                }) {
                    Text("저장")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                // 취소 버튼
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // 현재 화면을 닫고 이전 화면으로 돌아가기
                }) {
                    Text("취소")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
        }
        .padding()
        .navigationTitle("내 정보")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // 사용자 정보 저장 로직
    func saveChanges() {
        // 저장 처리 로직을 여기에 추가
        // 예: 서버에 사용자 정보를 전송하거나 로컬 저장소에 저장하는 코드
        print("Changes saved!")
    }
}

// 이미지 피커 구현
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            picker.dismiss(animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

#Preview {
    MyInfoView()
}
