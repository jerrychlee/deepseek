from transformers import AutoTokenizer, AutoModelForCausalLM
import torch

# 選擇模型 (可以改成 deepseek-ai/deepseek-lm-7b-base)
model_id = "deepseek-ai/deepseek-coder-7b-base"

# 載入 tokenizer 和模型
tokenizer = AutoTokenizer.from_pretrained(model_id)
model = AutoModelForCausalLM.from_pretrained(model_id,
                                             device_map="auto",
                                             torch_dtype=torch.float16)

# 輸入測試句子
prompt = "用 Python 寫一個計算費氏數列的函式。"
inputs = tokenizer(prompt, return_tensors="pt").to("mps")

# 生成文字
output = model.generate(**inputs, max_new_tokens=200)
result = tokenizer.decode(output[0], skip_special_tokens=True)

print("📝 推論結果：\n")
print(result)
