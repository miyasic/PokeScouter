import json
import csv

def main():
    format_data()
    csv_to_json()

## データを整形する関数
def format_data():
    with open("input.csv", encoding='shift_jis') as f:
        text = f.read()
        text = delete_asterisk(text)
        text = delete_number(text)
        text = text.replace('\n(', '(')
    with open('output.csv', 'w', encoding='shift_jis') as f:
        f.write(text)

## アスタリスクを削除する関数
def delete_asterisk(text):
    text = text.replace('*4', '')
    text = text.replace('*5', '')
    text = text.replace('*6', '')
    text = text.replace('*7', '')
    text = text.replace('*8', '')
    text = text.replace('*9', '')
    return text

def csv_to_json():
    # CSV ファイルを開く
    with open("output.csv", encoding='shift_jis') as f:
        # CSV ファイルを読み込んで、各行を辞書型に変換する
        reader = csv.DictReader(f)
        rows = list(reader)

    print(type(rows))
    pokemon_dict = dict()
    for data in rows:
        pokemon_dict[data['name']] = data
    # 変換したデータを JSON 形式に変換する
    data = json.dumps(rows)
    pokemon_json = json.dumps(pokemon_dict)

    # # JSON 形式のデータを出力する
    with open("output.json", "w", encoding='shift_jis') as f:
        f.write(pokemon_json)


## 数字を削除する関数
def delete_number(text: str):
    for i in range(21):
        text = text.replace(f'[{i}]', '')
    return text


if __name__ == '__main__':
    main()