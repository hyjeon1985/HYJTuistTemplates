#!/bin/bash

# 사용자 홈 디렉토리 경로 얻기
user_home=~
curr_path=$(pwd)
# echo $curr_path

# 매개변수 확인
if [ $# -ne 1 ]; then
    echo "템플릿 이름을 입력하세요."
    # 스크립트를 종료
    exit 0
fi

template_name="$1"

# 원본 템플릿 경로 설정
origin_path="$curr_path/$template_name"

# 원본 템플릿 경로가 존재하는지 확인
if [ ! -d "$origin_path" ]; then
    echo "존재하지 않는 템플릿입니다."
    # 스크립트를 종료
    exit 0
fi

# Tuist 설치 여부 확인
if ! command -v tuist &> /dev/null; then
    echo "Tuist가 설치되어 있지 않습니다. Tuist를 설치하세요."
    # 스크립트를 종료
    exit 0
fi

# Tuist 설치된 버전 확인
if tuist version &> /dev/null; then
    tuist_version=$(tuist version | awk 'END{print $NF}')
else
    tuist_version=$(tuist local | awk 'END{print $NF}')
fi

# 템플릿 경로 설정
templates_path="$user_home/.tuist/Versions/$tuist_version/Templates"

# 템플릿 경로가 존재하는지 확인
if [ ! -d "$templates_path" ]; then
    echo "템플릿 경로가 올바르지 않습니다."
    cd "$templates_path"
    echo "$templates_path"
    # 스크립트를 종료
    exit 0
fi

# 대상 템플릿 경로 설정
target_path="$templates_path/$template_name"

# 이미 존재하는 심볼릭 링크를 해제
if [ -L "$target_path" ]; then
    rm "$target_path"
fi

ln -s "$origin_path" "$target_path"
